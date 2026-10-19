---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "topologia"]
---

# Conceito - Topologia Evaluator-Optimizer

## Síntese corrente
Laço de refinamento: `Generator → Evaluator → [pass] → Output`, com retorno `[fail + feedback]` para o gerador. Usada quando a qualidade é mensurável e a primeira passada sai imperfeita. O risco dominante é **não convergir**: o laço precisa de saída dura e de detecção de platô, não de confiança cega no score do avaliador.

## Quando usar
- Qualidade mensurável ou pontuável.
- Espera-se que a primeira saída seja imperfeita.
- O ganho de refinamento paga a latência e o custo extra.

## Modos de falha
- Laço infinito se os critérios do avaliador forem impossíveis/contraditórios.
- Gerador para de melhorar após N iterações (retorno decrescente).
- Gerador e avaliador compartilham os mesmos pontos cegos.

## Regras de projeto
1. Avaliador usa **enquadramento de critérios diferente** das instruções do gerador.
2. Saída dura obrigatória: máximo de iterações (**recomendado: 3**), independente do score.
3. Saída do avaliador é estruturada: score, motivos específicos de falha, feedback acionável.
4. Logar o score de cada iteração — **platô em 2 iterações seguidas → sair e escalar**.
5. Ideal: gerador e avaliador de modelos diferentes ou com system prompts distintos.

## Conexões
- [[Conceito - Topologia Sequencial]] · [[Conceito - Engenharia de Modos de Falha]] · [[Conceito - Evals de Agentes e Pipelines]] · [[Conceito - Governança de Custo e Latência]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]
