---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "contexto"]
---

# Conceito - Arquitetura de Contexto em Pipelines de Agentes

## Síntese corrente
O contexto **compõe** ao longo de uma pipeline: numa cadeia de 5 agentes, o último recebe o input original + todas as saídas (500 → 1.500 → 3.500 → 7.500 → 15.000+ tokens). Estourar o orçamento causa alucinação, falha de aderência a instruções e truncamento do contexto inicial crítico. A arquitetura de contexto é a disciplina de decidir **quem lê o quê** e **em que formato**.

## Estratégias de gestão
1. **Compressão por sumarização** — cada agente produz saída completa + resumo (≤200 tokens); downstream recebe resumos. Mitigar perda definindo campos sempre preservados verbatim (IDs, decisões, restrições).
2. **Objeto de estado estruturado** — schema compartilhado (`task_id`, `original_input`, `constraints`, `agent_outputs`, `decisions`, `current_step`, `status`); cada agente lê só os campos do seu papel e escreve só os seus.
3. **Memória externa** — saídas longas em storage externo (vector DB/KV); agentes recuperam por lookup direcionado. Usar quando a pipeline gera artefatos intermediários grandes.
4. **Checkpointing de contexto** — em marcos, comprimir todo o estado anterior num checkpoint; agentes seguintes recebem só checkpoint + entradas imediatas.

## Regras de escopo
- O system prompt de cada agente especifica exatamente o que ele lê e escreve.
- Um agente nunca recebe o system prompt completo de outro.
- Dados sensíveis (PII, credenciais) ficam fora do estado inter-agente.
- Definir modelo de posse do contexto: quem pode sobrescrever quais campos.

## Modos de falha
- Falha de contexto: agente ignora instruções por sobrecarga → validar schema e aderência.
- Truncamento silencioso de campos obrigatórios → **parar e escalar** (ver [[Conceito - Engenharia de Modos de Falha]]).

## Conexões
- [[Conceito - Topologia Sequencial]] · [[Conceito - Topologia Hierárquica]] · [[Conceito - Governança de Custo e Latência]] · [[Conceito - Especialização e Contratos de Agentes]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]
