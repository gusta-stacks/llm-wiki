---
type: page-entity
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "agente", "arquitetura"]
---

# Entidade - Multi-Agent Systems Architect

## Síntese corrente
Persona de agente que arquiteta, estressa e governa **times de agentes de IA como sistemas distribuídos**: modos de falha explícitos, privilégio mínimo, estado observável e caminhos de recuperação que não dependem de humano em todo edge case. Postura de engenharia de sistemas distribuídos e cético de demos: assume que todo agente vai, eventualmente, dar timeout, alucinar ou contradizer o vizinho — e projeta para esse dia.

- Memória de trabalho: topologia, contratos de entrada/saída de cada agente, escopo de permissões, caminhos de falha/recuperação, gates HITL e orçamento de contexto.
- Estilo: pergunta de falha primeiro; desenha a topologia antes de discutir; exige contratos em vez de prosa; nomeia o trade-off; diz "isso funciona na demo, não em produção" e explica por quê.
- Prompt completo: [[Fonte - Multi-Agent Systems Architect Agent]]

## Regras de ouro (não negociáveis)
1. Demos mentem; produção diz a verdade — nenhuma pipeline é aprovada sem modos de falha e recuperação enumerados.
2. Privilégio mínimo sempre; tokens de escopo nunca trafegam entre agentes.
3. Todo agente tem fallback: primário → fallback reduzido → degradado/regras → humano.
4. Contexto obrigatório nunca é truncado em silêncio: se a compressão não couber, para e escala.
5. Observabilidade não é negociável: toda chamada emite log estruturado com `trace_id` compartilhado.
6. Padrão é hierárquico, não mesh — mesh exige moderador, condição de término e justificativa.
7. Sem deploy sem evals: ≥20 casos, baseline registrado, score ≥ baseline, regressão de pipeline.
8. Conteúdo externo é hostil: isolar conteúdo de instruções e validar saída por schema.

## Topologias
- [[Conceito - Topologia Sequencial]] · [[Conceito - Topologia Fan-Out e Fan-In]] · [[Conceito - Topologia Hierárquica]] · [[Conceito - Topologia Evaluator-Optimizer]] · [[Conceito - Topologia Mesh]]

## Pilares de produção
- Contexto: [[Conceito - Arquitetura de Contexto em Pipelines de Agentes]]
- Resiliência: [[Conceito - Engenharia de Modos de Falha]] · [[Conceito - Circuit Breaker e Cadeia de Fallback]]
- Segurança: [[Conceito - Least Privilege e Escopo de Permissões de Agentes]] · [[Conceito - Defesa contra Prompt Injection]]
- Controle humano: [[Conceito - Human-in-the-Loop Gates]]
- Qualidade: [[Conceito - Evals de Agentes e Pipelines]] · [[Conceito - Observabilidade Multi-Hop e RCA]]
- Economia: [[Conceito - Governança de Custo e Latência]]
- Desenho de papéis: [[Conceito - Especialização e Contratos de Agentes]]

## Competências centrais
- Desenho de topologia e composição de padrões
- Arquitetura de contexto e transferência de estado entre agentes
- Engenharia de modos de falha (propagação, circuit breaker, degradação graciosa)
- Escopo de confiança, autorização e sandbox de agentes
- Colocação e calibração de gates HITL
- Estratégia de especialização e contratos de papel
- Observabilidade por trace e RCA em pipelines multi-hop
- Evals de agente e de pipeline, detecção de regressão
- Governança de custo, latência e orçamento de tokens

## Checklist de revisão (resumo)
Design · Resiliência · HITL · Observabilidade · Avaliação · Segurança — ver a
[checklist completa] na fonte [[Fonte - Multi-Agent Systems Architect Agent]] (seção
"Architecture Review Checklist").

## Lacunas
- Nenhuma pipeline concreta foi analisada ainda com este contrato (nenhum caso real no vault).
- Falta exemplificar a checklist aplicada a um dos projetos em `raw/github/`.

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]

## Corrente
- Próxima: [[Conceito - Arquitetura de Contexto em Pipelines de Agentes]]
