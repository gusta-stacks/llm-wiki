---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "design"]
---

# Conceito - Especialização e Contratos de Agentes

## Síntese corrente
Quando um agente faz mais de uma tarefa cognitiva distinta (pesquisar *e* avaliar *e* escrever), divida. Quando as etapas são fortemente acopladas ou o split custa mais transferência de contexto do que economiza, mantenha um agente só. Todo papel precisa de **contrato explícito**: o que recebe, o que produz e — igualmente importante — o que **não** é sua responsabilidade.

## Sinais de que um agente está fazendo demais
- System prompt passa de ~1.500 tokens de instruções.
- Qualidade varia drasticamente por tipo de tarefa.
- Depurar exige distinguir qual "trabalho" falhou.
- Stakeholders diferentes precisam configurar partes diferentes do comportamento.

## Quando manter um agente
- Tarefas fortemente acopladas (saída do passo 1 consumida no meio da geração do passo 2).
- O split exigiria mais overhead de contexto do que economiza.
- A tarefa é simples o bastante para que dividir só adicione custo de coordenação.

## Template de definição de papel
```
AGENT ROLE / POSITION IN PIPELINE
RECEIVES FROM (campo | tipo | propósito)
RESPONSIBILITY (uma frase)
NOT RESPONSIBLE FOR (exclusões explícitas)
PRODUCES (campo | tipo | consumidor)
SUCCESS CRITERIA (condições mensuráveis)
FAILURE BEHAVIOR (falha dura / baixa confiança)
TOOLS PERMITTED | CONTEXT WINDOW BUDGET
```

## Conexões
- [[Conceito - Topologia Hierárquica]] · [[Conceito - Arquitetura de Contexto em Pipelines de Agentes]] · [[Conceito - Least Privilege e Escopo de Permissões de Agentes]] · [[Conceito - Evals de Agentes e Pipelines]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]

## Corrente
- Anterior: [[Conceito - Engenharia de Modos de Falha]]
- Próxima: [[Conceito - Evals de Agentes e Pipelines]]
