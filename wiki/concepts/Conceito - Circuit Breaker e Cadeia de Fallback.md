---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "resiliencia"]
---

# Conceito - Circuit Breaker e Cadeia de Fallback

## Síntese corrente
Dois mecanismos complementares de resiliência. O **circuit breaker** impede chamar repetidamente um agente que está falhando (retry loops, laços do optimizer); a **cadeia de fallback** garante que o sistema sempre produza *algo*: primário → fallback reduzido → degradado por regras → humano.

## Circuit breaker
Estados: **CLOSED** (normal) → **OPEN** (falhando) → **HALF-OPEN** (testando recuperação).
- CLOSED: rastreia taxa de falha em janela móvel; acima do limiar (ex.: 3 falhas em 5 tentativas) → OPEN.
- OPEN: requisições falham/escalam imediatamente; após cooldown (ex.: 60s) → HALF-OPEN.
- HALF-OPEN: permite uma requisição de teste; sucesso → CLOSED, falha → OPEN.

## Cadeia de fallback
| Prioridade | Agente | Condição |
|---|---|---|
| 1 (primário) | modelo completo | padrão |
| 2 (fallback) | agente mais leve, escopo reduzido | primário falha ou estoura SLA de latência |
| 3 (degradado) | saída por regras/template | fallback também falha |
| 4 (humano) | fila de revisão humana | todos os caminhos automáticos falham |

Regra de projeto: **o sistema sempre produz algo** — resposta estruturada degradada é melhor que falha silenciosa.

## Conexões
- [[Conceito - Engenharia de Modos de Falha]] · [[Conceito - Topologia Mesh]] · [[Conceito - Topologia Evaluator-Optimizer]] · [[Conceito - Human-in-the-Loop Gates]] · [[Conceito - Governança de Custo e Latência]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]

## Corrente
- Anterior: [[Conceito - Arquitetura de Contexto em Pipelines de Agentes]]
- Próxima: [[Conceito - Defesa contra Prompt Injection]]
