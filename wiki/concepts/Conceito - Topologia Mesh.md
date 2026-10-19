---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "topologia"]
---

# Conceito - Topologia Mesh

## Síntese corrente
Rede peer-to-peer onde agentes conversam entre si (`A ⟷ B ⟷ C ⟷ D`), buscando negociação ou consenso. É a topologia de **maior complexidade e mais difícil de depurar**: dependências circulares, deadlock de consenso e crescimento exponencial de contexto (cada agente lê a saída dos outros). Na dúvida, use [[Conceito - Topologia Hierárquica]] primeiro.

## Quando usar
- Agentes precisam negociar ou chegar a consenso.
- Nenhum agente sozinho tem contexto suficiente para a decisão final.
- Simulação de deliberação de painel de especialistas.

## Modos de falha
- Deadlock de consenso / dependências circulares.
- Crescimento exponencial de contexto.
- Debug muito difícil (causa raiz difusa entre pares).

## Regras de projeto
1. Raramente é a escolha certa para produção — **default é hierárquico**.
2. Exigir **agente moderador** ou condição de término (máx. rodadas, limiar de consenso).
3. Escopar leitura das saídas dos pares: **transcript completo vs. resumo**.
4. Definir mecanismo explícito de consenso: maioria, unanimidade, peso por confiança.
5. Circuit breaker: **sem consenso após N rodadas → escalar para humano**.

## Conexões
- [[Conceito - Topologia Hierárquica]] · [[Conceito - Circuit Breaker e Cadeia de Fallback]] · [[Conceito - Human-in-the-Loop Gates]] · [[Conceito - Governança de Custo e Latência]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]
