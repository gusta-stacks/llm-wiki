---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "topologia"]
---

# Conceito - Topologia Sequencial

## Síntese corrente
Cadeia linear `Input → Agent A → Agent B → Agent C → Output`, onde cada passo depende da saída do anterior. É a topologia mais simples de depurar, ao custo de latência somada e de perda de contexto entre hops (o último agente não vê o raciocínio do primeiro). Padrão natural para progressões como pesquisar → redigir → revisar → publicar.

## Quando usar
- Cada etapa depende da saída da etapa anterior.
- A tarefa tem progressão linear natural.
- Simplicidade de depuração vale mais que latência.

## Modos de falha
- Falha de um agente interrompe a pipeline inteira.
- Perda de contexto compõe a cada hop (sem visibilidade do raciocínio anterior).
- Cadeias longas degradam qualidade de saída.

## Regras de projeto
1. Passar saídas **estruturadas** entre agentes, não prosa crua.
2. Cada agente anexa um campo "context summary" para os downstream.
3. Limite de comprimento: cadeias com **>5 agentes** tendem a degradar.
4. Definir o que cada agente recebe, produz e **não** é responsável por fazer.

## Conexões
- [[Conceito - Topologia Fan-Out e Fan-In]] · [[Conceito - Topologia Hierárquica]] · [[Conceito - Arquitetura de Contexto em Pipelines de Agentes]] · [[Conceito - Especialização e Contratos de Agentes]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]

## Corrente
- Anterior: [[Conceito - Topologia Mesh]]
- Próxima: [[Fonte - Multi-Agent Systems Architect Agent]]
