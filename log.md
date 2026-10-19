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

## [2026-10-19] ingest | Espelho das skills do Codex

- fonte: `raw/skills/` — 33 pastas de skill copiadas de `~/.codex/skills/` (1.394 arquivos, 35,9 MB, inclui `.system/`)
- páginas: criadas 37 (`wiki/entities/Skill - <nome>.md`), atualizadas 2 (`index.md`, `log.md`)
- notas: cada página aponta para o `SKILL.md` espelhado; links aos `.md` de apoio entram no graph
- git: `raw/skills/` entrou no `.gitignore` (espelho read-only, igual a `raw/github/`)

## [2026-10-19] ingest | Prompt Multi-Agent Systems Architect

- fonte: `raw/notes/agente-arquiteto-multi-agentes.md` (texto integral, imutável) → [[Fonte - Multi-Agent Systems Architect Agent]]
- páginas: criadas 17 (1 fonte + 1 entidade hub [[Entidade - Multi-Agent Systems Architect]] + 15 conceitos em `wiki/concepts/`), atualizadas 2 (`index.md`, `log.md`)
- notas: atomização em grafo — topologias (5), contexto, falhas/resiliência, segurança, HITL, especialização, observabilidade/RCA, evals, custo/latência
- git: commit `ingest: prompt Multi-Agent Systems Architect em grafo`

## [2026-10-19] schema | Corrente de navegação entre todas as notas

- mudança: toda página de conteúdo passa a terminar com `## Corrente` (Anterior/Próxima), formando uma cadeia linear
- ordem: hub `Entidade - Multi-Agent Systems Architect` → 15 conceitos → 1 fonte → 12 projetos → 37 skills (66 notas)
- tooling: `tools/build-chain.ps1` reexecutado para regenerar a corrente (idempotente); documentado em `AGENTS.md` §6
- efeito: graph do Obsidian passa a ter um único componente conectado (sem ilhas)
