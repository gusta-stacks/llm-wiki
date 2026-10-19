---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "observabilidade"]
---

# Conceito - Observabilidade Multi-Hop e RCA

## Síntese corrente
Quando uma pipeline de 5 agentes erra, a falha pode estar em qualquer agente **ou na transferência de contexto entre eles**. Sem traces, achar a causa raiz é chute. Observabilidade mínima = log estruturado por chamada com `trace_id` compartilhado + trace consolidado por execução, permitindo reconstruir o caminho do erro.

## Log por chamada de agente
```json
{
  "trace_id": "uuid (compartilhado na execução da pipeline)",
  "span_id": "uuid (esta chamada)",
  "agent_id": "researcher_v2", "step": 2,
  "started_at": "ISO8601", "completed_at": "ISO8601", "latency_ms": 1243,
  "input_tokens": 1820, "output_tokens": 412, "total_cost_usd": 0.0087,
  "input_hash": "sha256 do input (dedup/cache)",
  "output": { }, "confidence": 0.82, "tools_called": ["web_search"],
  "errors": [], "model": "claude-opus-4-6",
  "status": "success | failure | partial | escalated"
}
```
Por execução de pipeline: latência/custo/tokens totais, agentes que rodaram/pularam/falharam, saída final, gates HITL disparados e decisões humanas.

## Protocolo de análise de causa raiz
1. **Blast radius** — o erro foi pontual ou propagou downstream?
2. **Trace backward** — partir da saída final; qual agente produziu o campo errado?
3. **Isolar** — input correto + output errado → falha do agente; input já errado → falha upstream; input e output corretos mas mau uso downstream → falha de contrato inter-agente.
4. **Classificar** — ambiguidade de prompt · sobrecarga de contexto · limitação de modelo · mismatch de schema · informação faltante.
5. **Corrigir + regressão** — corrigir a causa raiz, adicionar o caso ao eval set, rodar eval completo antes de redeploy.

## Conexões
- [[Conceito - Engenharia de Modos de Falha]] · [[Conceito - Circuit Breaker e Cadeia de Fallback]] · [[Conceito - Evals de Agentes e Pipelines]] · [[Conceito - Governança de Custo e Latência]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]

## Corrente
- Anterior: [[Conceito - Least Privilege e Escopo de Permissões de Agentes]]
- Próxima: [[Conceito - Topologia Evaluator-Optimizer]]
