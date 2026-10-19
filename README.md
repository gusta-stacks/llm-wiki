# llm-wiki — meu segundo cérebro compilado

Vault Obsidian + repositório Git que implementa o padrão **LLM Wiki** de Andrej
Karpathy ([gist original](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)).

A ideia: em vez de RAG (re-derivar tudo a cada pergunta), os LLMs **compilam uma
vez** as fontes brutas em um wiki interligado e **mantêm esse wiki permanente e
atualizado**. O humano cura fontes e faz perguntas; o LLM faz toda a manutenção.

> **Para humanos:** navegue este vault no Obsidian (links, graph view, Dataview).
> **Para LLMs:** leia [`AGENTS.md`](AGENTS.md) antes de qualquer operação — é o
> contrato completo de operação. (`CLAUDE.md` aponta para o mesmo contrato;
> Codex já recebe `.codex/config.toml` de projeto.)

## Estrutura

| Caminho             | Papel                                                                  |
|---------------------|------------------------------------------------------------------------|
| `AGENTS.md`         | Schema/contrato para qualquer LLM (a "configuração" principal)         |
| `index.md`          | Catálogo de todo o wiki — porta de entrada de consultas                |
| `log.md`            | Diário cronológico append-only (`init/ingest/query/lint/schema`)       |
| `overview.md`       | Síntese corrente de alto nível                                         |
| `raw/`              | Fontes brutas **imutáveis** (artigos, papers, notas) + `assets/`       |
| `wiki/sources/`     | Resumo: 1 página por fonte                                             |
| `wiki/entities/`    | Pessoas, organizações, lugares, projetos                               |
| `wiki/concepts/`    | Conceitos e técnicas                                                   |
| `wiki/analyses/`    | Respostas valiosas arquivadas (comparações, teses, explorações)        |
| `_templates/`       | Modelos de página (plugin core Templates do Obsidian)                  |
| `tools/`            | Helpers de CLI                                                         |

## Como usar (3 passos)

1. **Obsidian** → `Open folder as vault` → abrir a pasta deste repositório.
2. Instalar o plugin community **Dataview** (Settings → Community plugins). A pasta
   de anexos já está configurada para `raw/assets/` e os templates para `_templates/`.
3. **Fluxo do dia a dia:**
   - *Ingest*: solte fontes em `raw/articles|papers|notes` e peça ao seu agente
     (OpenCode, Claude Code, etc.: "processa a fonte X"), que criará a página-fonte,
     atualizará entidades/conceitos, o `index.md` e o `log.md`.
   - *Query*: pergunte qualquer coisa — boas respostas viram páginas em `wiki/analyses/`.
   - *Lint*: peça uma auditoria de saúde de vez em quando (contradições, órfãs, lacunas).

## Git / GitHub

- Branch `main`; **um commit por operação** com mensagem semântica curta
  (`ingest: ...`, `query: ...`, `lint: ...`, `schema: ...`).
- `.gitignore` exclui apenas ruído do Obsidian (`workspace*`, `.trash/`, plugins baixados).
- Todo o conteúdo (`wiki/` e `raw/`) é versionado — o histórico é a memória de longo prazo.

Créditos do padrão: [@karpathy](https://gist.github.com/karpathy) — LLM Wiki.
