---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "seguranca"]
---

# Conceito - Defesa contra Prompt Injection

## Síntese corrente
Agentes que processam conteúdo externo (páginas web, documentos do usuário, e-mails) são alvo de prompt injection: conteúdo malicioso que sequestra as instruções do agente. A defesa parte de um princípio: **conteúdo nunca é instrução**. Conteúdo externo é isolado, sanitizado e validado por schema antes de chegar aos agentes de decisão.

## Mitigações
1. **Separar processamento de conteúdo do de instrução** — nunca concatenar conteúdo externo direto no system prompt.
2. **Agente sanitizador** — papel cujo único trabalho é extrair dado estruturado de conteúdo não confiável antes de repassar.
3. **Validação por schema** — saídas estruturadas com enforcement de schema; instruções injetadas não produzem JSON válido.
4. **Quarentena** — sinalizar/flagrar qualquer saída que contenha linguagem de instrução (verbos imperativos + nomes de ferramentas).

## Conexões
- [[Conceito - Least Privilege e Escopo de Permissões de Agentes]] · [[Conceito - Engenharia de Modos de Falha]] · [[Conceito - Evals de Agentes e Pipelines]] · [[Conceito - Especialização e Contratos de Agentes]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]
