---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "resiliencia"]
---

# Conceito - Engenharia de Modos de Falha

## Síntese corrente
Toda pipeline de agentes vai falhar — a diferença é entre falhar **de forma detectada e recuperável** e falhar em silêncio. A engenharia de modos de falha enumera a taxonomia (up, silenciosa, parcial, contradição, cascata, laço, contexto), define **detecção** e **recuperação** para cada uma, e proíbe aprovar arquitetura cujos modos de falha não estejam mapeados com caminho de volta.

## Taxonomia e recuperação
| Falha | Detecção | Recuperação |
|---|---|---|
| Dura (erro/timeout) | código de erro / timeout | retry com backoff → agente de fallback → humano |
| Silenciosa (saída errada) | agente avaliador; validação de schema | retry com prompt de correção → revisão humana |
| Parcial (campos faltando) | validação de schema/completude | pedir campos faltantes → regenerar |
| Contradição | detector explícito de contradição | agente de arbitragem → decisão humana |
| Cascata | validação de checkpoint; detecção de anomalia | rollback ao último checkpoint; reexecutar do ponto de falha |
| Laço (não converge) | contador de iterações; detecção de platô | sair à força; escalar com a melhor saída |
| Contexto (ignora instruções) | validação de schema; checagem de aderência | enxugar contexto; reexecutar com estado comprimido |

## Regras de projeto
1. Nenhum caminho termina em silêncio: sempre há saída estruturada, mesmo degradada.
2. Checkpoint após todo agente com efeito colateral irreversível.
3. Toda ação repetível é **idempotente** ou tem **ação de compensação** definida.
4. Definir Recovery Point Objective: até onde a pipeline pode reexecutar com segurança.

## Conexões
- [[Conceito - Circuit Breaker e Cadeia de Fallback]] · [[Conceito - Observabilidade Multi-Hop e RCA]] · [[Conceito - Arquitetura de Contexto em Pipelines de Agentes]] · [[Conceito - Human-in-the-Loop Gates]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]
