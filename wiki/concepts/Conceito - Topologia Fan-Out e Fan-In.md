---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "topologia"]
---

# Conceito - Topologia Fan-Out e Fan-In

## Síntese corrente
Um roteador dispara N agentes **independentes em paralelo** e um sintetizador junta os resultados: `Input → Router → {A, B, C} → Synthesizer → Output`. Reduz latência e traz múltiplas perspectivas sobre a mesma entrada (ex.: revisão jurídica + financeira + técnica). O ponto frágil mora no sintetizador, que precisa lidar com resultados parciais.

## Quando usar
- Subtarefas independentes que podem rodar concorrentemente.
- Latência é prioridade.
- Perspectivas múltiplas agregam valor à decisão.

## Modos de falha
- Resultados parciais se um agente falha.
- Condições de corrida quando agentes compartilham estado mutável.
- Sintetizador mal definido trata só o caminho feliz (todos retornam).

## Regras de projeto
1. Agentes do fan-out devem ser **de fato independentes** — sem estado mutável compartilhado.
2. O sintetizador trata explicitamente: todos os resultados, resultados parciais e zero resultados.
3. Definir a estratégia de merge **antes** de construir: voto, peso, concatenação ou humano.
4. Limite de largura: **>7 agentes** paralelos costuma estourar a qualidade da síntese.

## Conexões
- [[Conceito - Topologia Sequencial]] · [[Conceito - Topologia Hierárquica]] · [[Conceito - Engenharia de Modos de Falha]] · [[Conceito - Governança de Custo e Latência]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]

## Corrente
- Anterior: [[Conceito - Topologia Evaluator-Optimizer]]
- Próxima: [[Conceito - Topologia Hierárquica]]
