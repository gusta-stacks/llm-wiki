# wiki/ — camada escrita pelo LLM

Todo o conteúdo daqui é mantido **exclusivamente pelo LLM** conforme o contrato
`AGENTS.md`; o humano lê e navega.

| Pasta          | Conteúdo                                            |
|----------------|-----------------------------------------------------|
| `sources/`     | Resumo integrado, 1 página por fonte bruta          |
| `entities/`    | Pessoas, organizações, lugares, projetos, produtos  |
| `concepts/`    | Conceitos, técnicas, temas                          |
| `analyses/`    | Respostas valiosas arquivadas (comparações, teses)  |

Convenções resumidas:

- nomes de arquivo: `Fonte - Título.md`, `Entidade - Nome.md`, `Conceito - Tema.md`, `Análise - Tema.md`
- toda página tem frontmatter YAML (`type`, `created`/`updated`, `sources`, `tags`)
- toda página termina com `## Fontes`
- links internos sempre `[[wikilinks]]`

Arquivos de suporte na raiz do vault: `index.md` (catálogo) · `overview.md` (síntese) · `log.md` (diário).
