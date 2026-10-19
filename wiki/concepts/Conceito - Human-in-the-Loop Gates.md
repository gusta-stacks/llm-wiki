---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "hitl"]
---

# Conceito - Human-in-the-Loop Gates

## Síntese corrente
Gates de revisão humana precisam ser **calibrados**: escalar demais faz o humano carimbar sem ler (HITL vira teatro); escalar de menos faz o sistema acumular falsa confiança até a falha catastrófica. O framework define *onde* colocar o gate (critério), *que tipo* (bloqueante, aviso, amostragem) e *o que* a interface precisa mostrar para a revisão ser real.

## Onde colocar o gate
| Critério | Exemplo | Tipo de gate |
|---|---|---|
| Irreversibilidade | enviar e-mail em massa; apagar registros; publicar | aprovação bloqueante |
| Alto blast radius | afeta >100 usuários / >$10k | aprovação bloqueante |
| Baixa confiança | score <0.7; saídas contraditórias | revisão bloqueante |
| Situação nova | padrão de input fora do eval set | flag consultivo |
| Exposição regulatória | conselho legal, médico, financeiro | aprovação bloqueante |
| Política explícita | regra de negócio exige sign-off | aprovação bloqueante |

## Tipos de gate
- **Bloqueante**: pipeline pausa; humano recebe resumo estruturado + ação recomendada e aprova/rejeita/modifica. Definir **timeout** (aprovar por padrão, rejeitar por padrão ou escalar) e SLA.
- **Consultivo**: pipeline segue, mas sinaliza para revisão assíncrona; humano pode disparar rollback na janela.
- **Amostragem**: humano revisa X% aleatório; taxa **adaptativa** sobe quando a taxa de erro sobe.

## Requisitos da interface
Mostrar: decisão + raciocínio (trace, não só conclusão) · alternativas consideradas · consequência de aprovar vs. rejeitar · confiança do agente · aprovar/rejeitar/escalar em um clique.

## Conexões
- [[Conceito - Engenharia de Modos de Falha]] · [[Conceito - Circuit Breaker e Cadeia de Fallback]] · [[Conceito - Evals de Agentes e Pipelines]] · [[Conceito - Observabilidade Multi-Hop e RCA]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]
