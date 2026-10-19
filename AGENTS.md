# AGENTS.md — Schema do LLM Wiki (contrato de operação)

Este vault implementa o padrão **LLM Wiki** de Andrej Karpathy — uma base de
conhecimento pessoal construída e mantida *persistentemente* por LLMs, sobre
camadas de fontes brutas imutáveis.

> **REGRA Nº 0** — Qualquer LLM/agente (OpenCode, Claude Code, Codex, Cursor, etc.)
> que for criar, editar, mover ou consultar dados neste repositório **DEVE ler este
> arquivo inteiro antes de tocar em qualquer dado**. Claude Code tem um atalho em
> `CLAUDE.md`; agentes OpenCode/Codex descobrem este arquivo automaticamente.

---

## 1. Filosofia (o que difere isto de RAG)

- O conhecimento **não é re-derivado** a cada pergunta: é **compilado uma vez** em
  páginas interligadas e **mantido atual** a cada fonte nova.
- O wiki é um **artefato persistente e cumulativo**: os cross-references já existem,
  as contradições já estão sinalizadas, a síntese já reflete tudo que foi lido.
- Papéis fixos:
  - **Humano** — seleciona fontes, direciona a análise, faz boas perguntas, decide as conclusões.
  - **LLM** — todo o resto: resumir, cross-referenciar, arquivar, atualizar, auditar.
- **Boas respostas viram páginas.** O resultado valioso de uma consulta deve ser
  arquivado no wiki, nunca morrer no histórico do chat. Assim as explorações
  também se acumulam.
- Obsidian é a interface: o humano navega o resultado em tempo real (links, graph
  view, páginas atualizadas).

## 2. As três camadas

| Camada        | Local                                                        | Dono da escrita                        | Regra |
|---------------|--------------------------------------------------------------|----------------------------------------|-------|
| Fontes brutas | `raw/`                                                       | **Imutável** — só leitura, nunca escrita | fonte da verdade |
| Wiki          | `wiki/`, `index.md`, `overview.md`, `_templates/`            | **Exclusivamente o LLM**               | o humano lê |
| Schema        | `AGENTS.md` (este arquivo) e `CLAUDE.md`                     | co-evolução humano + LLM               | configurar as regras |

```text
llm-wiki/
├── AGENTS.md / CLAUDE.md   # schema (regras para qualquer LLM)
├── README.md               # documentação humana / GitHub
├── .codex/config.toml      # config de projeto do OpenAI Codex
├── index.md                # catálogo de todo o wiki (orientado a conteúdo)
├── log.md                  # registro cronológico append-only
├── overview.md             # síntese corrente de alto nível
├── raw/                    # FONTES IMUTÁVEIS
│   ├── articles/  papers/  notes/
│   └── assets/             # imagens e anexos (pasta de anexos do Obsidian)
├── wiki/                   # camada escrita pelo LLM
│   ├── sources/   # 1 página de resumo por fonte
│   ├── entities/  # pessoas, organizações, lugares, projetos, produtos
│   ├── concepts/  # conceitos, técnicas, temas
│   └── analyses/  # respostas arquivadas: comparações, teses, explorações
├── _templates/             # modelos de página (plugin core "Templates")
└── tools/                  # helpers de CLI (busca, etc.)
```

## 3. Regras de ouro

1. **NUNCA editar, renomear ou apagar nada em `raw/`.** Ler sim, escrever jamais.
2. Toda página do wiki tem **frontmatter YAML válido** (seção 5) e termina com **`## Fontes`**.
3. Links internos **sempre** em wikilinks `[[Nome da Página]]` — nunca caminhos
   relativos markdown. Fontes brutas podem ser citadas por caminho (`raw/articles/x.md`)
   junto com o wikilink da página-fonte correspondente.
4. Nenhum fato fica **sem fonte**. Exceções razoáveis: `overview.md`, `index.md`, `log.md`.
5. **Toda fonte nova resulta, no mínimo,** em: 1 página `wiki/sources/`, atualização de
   todas as entidades/conceitos relevantes, atualização de `index.md`, entrada em `log.md`.
6. Contradições são **sinalizadas, nunca silenciadas**: use
   `> ⚠️ **Contradição:** ...` na página afetada e resolva depois com o humano.
7. `log.md` é **append-only** — nunca editar ou remover entradas antigas.
8. Ao consultar, não escanear o vault inteiro: ler `index.md` primeiro, abrir 3–10
   páginas relevantes, responder **com citações** `[[página]]`.
9. Idioma do conteúdo: **PT-BR**. Prefixos de log, campos YAML e chaves de metadados: inglês.
10. Terminar cada operação (`ingest`/`query`/`lint`) com entrada no `log.md` e,
    quando o humano permitir, um commit de git com o formato da seção 10.

## 4. Tipos de página e nomenclatura

| Tipo            | Pasta             | O que é                                          |
|-----------------|-------------------|--------------------------------------------------|
| `page-source`   | `wiki/sources/`   | Resumo integrado de UMA fonte bruta              |
| `page-entity`   | `wiki/entities/`  | Nomes próprios: pessoas, orgs, lugares, projetos |
| `page-concept`  | `wiki/concepts/`  | Conceitos, técnicas, temas abstratos             |
| `page-analysis` | `wiki/analyses/`  | Respostas arquivadas e de valor permanente       |
| `overview`      | `overview.md`     | Síntese narrativa corrente de tudo               |
| `index`         | `index.md`        | Catálogo por categoria (a porta de entrada do LLM) |
| `log`           | `log.md`          | Diário cronológico append-only                   |

**Nome de arquivo = prefixo do tipo + título em Title Case:**
`Fonte - <Título>.md`, `Entidade - <Nome>.md`, `Conceito - <Tema>.md`, `Análise - <Tema>.md`.

## 5. Frontmatter padrão (compatível com Dataview)

```yaml
# page-source
---
type: page-source
source: "raw/articles/exemplo.md"   # caminho em raw/ ou URL
source-type: artigo                  # artigo | paper | livro | audio | video | conversa | dados
ingested: 2026-10-19
tags: []
---
```

```yaml
# page-entity / page-concept
---
type: page-entity            # ou page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Exemplo]]"]
tags: []
---
```

```yaml
# page-analysis
---
type: page-analysis
question: "A pergunta que motivou a análise"
created: 2026-10-19
sources: ["[[Fonte - Exemplo]]"]
tags: []
---
```

- `updated` é atualizado **a cada edição** da página.
- `sources` lista as páginas-fonte do tipo `page-source`; o número de fontes é a
  medida de maturidade da página.
- Tags: minúsculas, kebab-case e strings simples (não wikilinks): `["rede-neural"]`.

## 6. Convenções de seção

- **`page-source`**
  `## Resumo` (5–10 linhas escritas para o wiki) · `## Pontos-chave` (bullets
  atômicos, com wikilinks para entidades/conceitos) · `## Citações` (quando
  relevante) · `## Impacto no wiki` (páginas criadas/atualizadas neste ingest) ·
  `## Fontes` (caminho em `raw/` ou URL).
- **`page-entity` / `page-concept`**
  `## Síntese corrente` (o melhor retrato do conhecimento no momento) ·
  `## Observações por fonte` (uma nota por fonte, com wikilink) · `## Timeline`
  (quando fizer sentido) · `## Lacunas` (o que ainda falta investigar) · `## Fontes`.
- **`page-analysis`**
  `## Pergunta` · `## Resposta` (com citações) · `## Próximos passos` · `## Fontes`.

## 7. Operações

### 7.1 Ingest (humano solta fonte e pede o processamento)

1. Ler a fonte completa em `raw/` (se houver imagens: ler o texto primeiro, ver as
   imagens depois, uma a uma).
2. Discutir os pontos-chave com o humano antes de escrever (fluxo interativo) —
   a menos que o humano tenha pedido batch process sem supervisão.
3. Criar `wiki/sources/Fonte - <Título>.md` (template `_templates/`).
4. Criar/atualizar **todas** as `page-entity` e `page-concept` relevantes:
   - criar página quando um conceito importante ainda não tem a própria;
   - atualizar `updated`, anexar nota em `## Observações por fonte`,
     consolidar `## Síntese corrente`;
   - sinalizar contradições com `> ⚠️ **Contradição:** ...`.
   Uma fonte pode tocar **10–15 páginas** — é o comportamento esperado.
5. Atualizar `overview.md` se a fonte muda a tese geral.
6. Atualizar `index.md` com a página nova e ajustes de resumo.
7. Registrar em `log.md`: `## [YYYY-MM-DD] ingest | <Título da fonte>`.
8. Sugerir 2–3 perguntas de follow-up que a fonte abre.

### 7.2 Query

1. Ler `index.md` por inteiro primeiro.
2. Abrir as páginas relevantes (normalmente 3–10).
3. Responder **com citações** `[[página]]`. Se não existe resposta no wiki, dizer
   explicitamente "ainda não está no wiki" e propor fontes — nunca inventar.
4. Se a resposta tem valor permanente (comparação, tese, conexão nova): arquivar
   como `wiki/analyses/Análise - <Tema>.md` e atualizar `index.md`.
5. Sempre encerrar com entrada no `log.md` (`## [YYYY-MM-DD] query | <tema>`),
   mesmo para respostas não arquivadas.

### 7.3 Lint (auditoria de saúde, periódica)

Procurar e reportar:

- [ ] contradições entre páginas;
- [ ] claims desatualizados, superados por fontes mais recentes;
- [ ] páginas órfãs (sem links de entrada);
- [ ] conceitos importantes citados mas sem página própria (promover a `page-concept`);
- [ ] wikilinks quebrados;
- [ ] lacunas que uma busca na web fecharia.

Encerrar com novas perguntas a investigar e novas fontes a buscar. Logar como
`## [YYYY-MM-DD] lint | escopo da auditoria`.

## 8. `index.md` — catálogo (a porta de entrada do LLM)

Orientado a conteúdo, organizado por categoria. Formato de entrada:

```markdown
## Fontes
- [[Fonte - Como tomar notas inteligentes]] — resumo de uma linha. (2026-10-19, 1 fonte)

## Entidades
- [[Entidade - Nikola Tesla]] — engenheiro; hub das invenções no séc. XIX. (2026-10-19, 3 fontes)
```

- Atualizar a entrada **existente** (mesma linha) em vez de acumular duplicados.
- Categorias fixas: Fontes, Entidades, Conceitos, Análises (+ as que surgirem).
- Neste ecossistema **não há RAG/embeddings**: em escala moderada (~100 fontes,
  centenas de páginas) o índice é a busca. Se um dia faltar fôlego, usar busca
  local de markdown (ex.: `qmd`) via `tools/`.

## 9. `log.md` — diário append-only

Toda entrada começa com o prefixo fixo greppable:

```markdown
## [2026-10-19] ingest | Título curto
- fonte: raw/articles/x.md → [[Fonte - x]]
- páginas: criadas 1, atualizadas 6 (lista curta)
- nota: contradição sinalizada em [[Conceito - exemplo]] (resolver com humano)
```

Operações: `init | ingest | query | lint | schema | revert`.

- Unix: `grep -E '^## \[' log.md | tail -5`
- PowerShell: `Select-String '^## \[' log.md | Select-Object -Last 5`

## 10. Git / GitHub

- Branch única `main`; commits diretos são aceitáveis para wiki solo.
- **Um commit por operação** (não por página), mensagem semântica curta:
  `ingest: <título da fonte>` · `query: <tema>` · `lint: <escopo>` · `schema: <mudança>` · `init: <bootstrap>`.
- Nunca versionar: `.obsidian/workspace*`, `.trash/`, lixo de SO (ver `.gitignore`).
- Nunca commitar segredos.

## 11. Plugins Obsidian recomendados

- **Dataview** (community) — consultas sobre o frontmatter da seção 5.
- **Graph view** (core) — visualizar hubs e órfãs.
- **Templates** (core) — modelos em `_templates/` (já configurado).
- **Slides/Marp** (opcional) — apresentações geradas a partir do wiki.

## 12. Co-evolução do schema

Este arquivo é vivo. Quando uma convenção provar-se errada ou faltar, propor a
mudança ao humano e, aceita, editar este arquivo e registrar
`## [YYYY-MM-DD] schema | <mudança>`. Mudanças de schema ganham commit próprio.

## 13. Suporte por agente

| Agente                          | Como recebe o contrato                                                        |
|---------------------------------|-------------------------------------------------------------------------------|
| **OpenAI Codex** (CLI/IDE)      | lê `AGENTS.md` automaticamente + `.codex/config.toml` (config de projeto)     |
| **Claude Code**                 | lê `CLAUDE.md`, que aponta para este `AGENTS.md`                              |
| **OpenCode / Cursor / outros**  | lê `AGENTS.md` (convenção universal de agentes)                               |

Verificação rápida no Codex (da raiz do repo, projeto confiável):

```bash
codex --ask-for-approval never "Resuma o contrato de operação do vault."
```

O Codex deve citar `AGENTS.md` e as regras de `ingest`/`query`/`lint`/`log.md`.
