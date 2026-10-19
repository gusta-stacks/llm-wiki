---
type: page-source
source: "raw/notes/agente-arquiteto-multi-agentes.md"
source-type: conversa
ingested: 2026-10-19
tags: ["multi-agente", "arquitetura", "prompt"]
---

# Fonte - Multi-Agent Systems Architect Agent

## Resumo
Definição completa de um agente/persona especializado em **arquitetar times de agentes de IA como sistemas distribuídos**. A tese central: nada é "arquitetura" se só sobrevive à demo — precisa aguentar carga de produção, entradas ambíguas e falhas em cascata. Cobre cinco topologias (sequencial, fan-out/fan-in, hierárquica, evaluator-optimizer, mesh), arquitetura de contexto e orçamento de tokens, engenharia de modos de falha (taxonomia, circuit breaker, cadeia de fallback, rollback/idempotência), escopo de confiança e privilégio mínimo, defesa contra prompt injection, gates human-in-the-loop, estratégia de especialização de agentes, observabilidade multi-hop com RCA, framework de evals e governança de custo/latência. Fecha com um checklist de revisão de arquitetura em seis blocos (design, resiliência, HITL, observabilidade, evals, segurança).

## Pontos-chave
- **8 regras críticas**: demos mentem; privilégio mínimo sempre; todo agente tem fallback; nunca truncar contexto obrigatório silenciosamente; observabilidade obrigatória (`trace_id`); padrão é hierárquico, não mesh; sem deploy sem evals (≥20 casos + baseline + regressão); conteúdo externo é hostil.
- Topologias são escolhas com trade-offs explícitos — ver [[Conceito - Topologia Sequencial]], [[Conceito - Topologia Fan-Out e Fan-In]], [[Conceito - Topologia Hierárquica]], [[Conceito - Topologia Evaluator-Optimizer]] e [[Conceito - Topologia Mesh]].
- O orçamento de contexto **compõe** ao longo da cadeia; ver [[Conceito - Arquitetura de Contexto em Pipelines de Agentes]].
- Modos de falha têm taxonomia com detecção e recuperação; ver [[Conceito - Engenharia de Modos de Falha]] e [[Conceito - Circuit Breaker e Cadeia de Fallback]].
- Segurança de agentes: [[Conceito - Least Privilege e Escopo de Permissões de Agentes]] e [[Conceito - Defesa contra Prompt Injection]].
- Controle humano calibrado: [[Conceito - Human-in-the-Loop Gates]].
- Qualidade e operação: [[Conceito - Evals de Agentes e Pipelines]], [[Conceito - Observabilidade Multi-Hop e RCA]], [[Conceito - Governança de Custo e Latência]] e [[Conceito - Especialização e Contratos de Agentes]].
- Persona operacional: [[Entidade - Multi-Agent Systems Architect]].

## Citações
> "Demos lie; production tells the truth."

> "Never silently truncate required context — this is a leading cause of silent failures in production pipelines."

> "If you can't trace a wrong answer back to the agent that caused it, the system isn't production-ready."

## Impacto no wiki
- criada: esta página-fonte + 1 entidade (hub) + 15 conceitos
- atualizadas: [[index]], `log.md`

## Fontes
- `raw/notes/agente-arquiteto-multi-agentes.md` (texto integral, imutável)

## Corrente
- Anterior: [[Conceito - Topologia Sequencial]]
- Próxima: [[Entidade - 1248dsaijh219837]]
