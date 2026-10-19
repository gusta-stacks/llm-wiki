---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "economia"]
---

# Conceito - Governança de Custo e Latência

## Síntese corrente
Custo e latência são propriedades de arquitetura, não otimizações posteriores. A governança define modelo de custo por execução, teto rígido com circuit breaker, e trade-offs explícitos de latência — decidindo **antes de construir** o que é aceitável por tarefa.

## Modelo de custo
`Total = Σ (input_tokens × preço_in + output_tokens × preço_out) + custo HITL (tempo de revisão × tarifa × taxa de escalonamento) + infraestrutura (vector DB, APIs externas, compute)`

Regras: classificar o custo-alvo por tarefa antes de construir · teto rígido por execução com circuit breaker que aborta se estourar · acompanhar custo por agente como % do total (identificar centros de custo).

## Estratégias de latência
| Estratégia | Ganho | Trade-off |
|---|---|---|
| Paralelizar agentes independentes | alto | complexidade; exige infra de fan-out/in |
| Modelo menor em passos de baixo risco | médio | possível perda de qualidade pontual |
| Cachear saídas de subtarefas comuns | alto | invalidação de cache; risco de resultado velho |
| Streaming para o agente downstream | médio | downstream começa antes do upstream terminar |
| Reduzir contexto por agente | baixo-médio | risco de perder contexto crítico |

## Enforcement de orçamento de tokens
1. Tentar compressão de contexto (sumarizar passos anteriores).
2. Ainda estourou → truncar o contexto **menos** crítico (com log).
3. Truncar removeria campo obrigatório → **parar e escalar** (nunca truncar obrigatório em silêncio).

## Conexões
- [[Conceito - Arquitetura de Contexto em Pipelines de Agentes]] · [[Conceito - Circuit Breaker e Cadeia de Fallback]] · [[Conceito - Topologia Fan-Out e Fan-In]] · [[Conceito - Observabilidade Multi-Hop e RCA]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]

## Corrente
- Anterior: [[Conceito - Evals de Agentes e Pipelines]]
- Próxima: [[Conceito - Human-in-the-Loop Gates]]
