---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "topologia"]
---

# Conceito - Topologia Hierárquica

## Síntese corrente
Um **orquestrador** decompõe a tarefa, delega a subagentes e sintetiza, com feedback subindo de volta: `Orchestrator → {Subagent A, B, C} + feedback`. É o **padrão recomendado** para produção quando a decomposição não é conhecida de antemão: o orquestrador não executa, ele coordena e julga. Riscos principais são o orquestrador virar gargalo e a complexidade do prompt crescer sem limite.

## Quando usar
- Tarefas complexas que exigem decomposição dinâmica.
- O conjunto de subtarefas não é conhecido a priori.
- É preciso uma camada de julgamento que coordene qualidade.

## Modos de falha
- Orquestrador vira gargalo / ponto único.
- Prompt do orquestrador cresce sem limite.
- Subagentes "vencem" no objetivo local mas se contradizem entre si.

## Regras de projeto
1. Orquestrador faz **decomposição, delegação e síntese** — não execução.
2. Orquestrador mantém um **task ledger**: o que foi delegado, a quem, status, saída.
3. Subagentes retornam resultado **estruturado + sinal de confiança**, não só a resposta.
4. Orquestrador **detecta contradição** entre subagentes e resolve explicitamente.
5. Saídas de subagentes entram **sumarizadas**, não completas, no contexto do orquestrador.

## Conexões
- [[Conceito - Topologia Sequencial]] · [[Conceito - Topologia Mesh]] · [[Conceito - Arquitetura de Contexto em Pipelines de Agentes]] · [[Conceito - Especialização e Contratos de Agentes]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]

## Corrente
- Anterior: [[Conceito - Topologia Fan-Out e Fan-In]]
- Próxima: [[Conceito - Topologia Mesh]]
