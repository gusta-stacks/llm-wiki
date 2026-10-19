# Log — diário do vault

Registro cronológico **append-only**. Formato de entrada:
`## [AAAA-MM-DD] <op> | <título curto>` — ver `AGENTS.md` §9.

## [2026-10-19] init | Bootstrap do vault

- criado ecossistema completo conforme o padrão LLM Wiki (karpathy, gist 442a6bf555914893e9891c11519de94f)
- estrutura: `raw/` (articles, papers, notes, assets) · `wiki/` (sources, entities, concepts, analyses) · `_templates/` · `tools/`
- schema: `AGENTS.md` (contrato completo) + `CLAUDE.md` (atalho) · `index.md` · `overview.md` · `log.md`
- Obsidian: anexos → `raw/assets/` · templates → `_templates/` · Dataview recomendado via frontmatter
- git: branch `main`, `.gitignore` de ruído Obsidian · nenhum conhecimento ingerido ainda

## [2026-10-19] ingest | Espelho dos repositórios do GitHub

- fonte: `raw/github/` — 12 clones depth 1 (lista via API pública do GitHub)
- páginas: criadas 12 (`wiki/entities/Entidade - <repo>.md`), atualizadas 2 (`index.md`, `log.md`)
- notas: repos privados ficaram de fora (gh sem autenticação); páginas são esqueletos aguardando ingest real de conteúdo
- git: `raw/github/` entrou no `.gitignore` (espelho read-only fora do versionamento do vault)
