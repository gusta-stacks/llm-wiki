# CLAUDE.md

Este vault usa um contrato único. Leia e siga **integralmente** o arquivo
**`AGENTS.md`** na raiz — ele é o schema definitivo (operações `ingest`/`query`/`lint`,
frontmatter, convenções de páginas, `index.md`, `log.md`, regras de git).

Resumo de 4 linhas (delegue sempre ao `AGENTS.md` em caso de dúvida):

1. Nunca escrever em `raw/` — essa camada é imutável.
2. Todo conhecimento novo entra como wikilinks `[[Página]]`, com frontmatter YAML e seção final `## Fontes`.
3. Toda fonte nova atualiza: página em `wiki/sources/` + entidades/conceitos + `index.md` + `log.md`.
4. `log.md` é append-only, com prefixo `## [YYYY-MM-DD] <op> | <título>`.
