---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "qualidade"]
---

# Conceito - Evals de Agentes e Pipelines

## Síntese corrente
Sem evals, mudar um prompt é aposta. A disciplina é ter **dois níveis**: evals por agente (independentes) e evals de pipeline (ponta a ponta), com baseline registrado e gate de deploy: a versão nova precisa **atingir ou superar** o baseline e passar na regressão completa antes de subir.

## Evals por agente
| Tipo | O que testa | Método |
|---|---|---|
| Funcional | faz o trabalho corretamente? | pares input/output com resposta conhecida |
| Aderência a instruções | segue as restrições do system prompt? | entradas adversariais para provocar violações |
| Conformidade de schema | a saída sempre bate o schema? | validação automatizada em 100+ amostras |
| Calibração de confiança | confiança 0.9 = 90% de acerto? | comparar confiança declarada com acurácia real |
| Edge cases | vazio, malformado, fora de domínio? | casos de fronteira e negativos |

## Evals de pipeline
Acurácia ponta a ponta · recuperação de falha · conformidade de custo · SLA de latência · taxa de disparo HITL (nem alta nem baixa demais) · regressão (casos que passavam continuam passando).

## Regra de desenvolvimento orientado a evals
Nunca fazer deploy de agente novo/alterado sem:
1. Suite de eval com **≥20 casos** representativos.
2. **Baseline** de score da versão atual.
3. Score da nova versão **≥ baseline**.
4. Checagem de **regressão** no eval set completo da pipeline.

## Conexões
- [[Conceito - Observabilidade Multi-Hop e RCA]] · [[Conceito - Human-in-the-Loop Gates]] · [[Conceito - Topologia Evaluator-Optimizer]] · [[Conceito - Especialização e Contratos de Agentes]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]

## Corrente
- Anterior: [[Conceito - Especialização e Contratos de Agentes]]
- Próxima: [[Conceito - Governança de Custo e Latência]]
