---
type: page-concept
created: 2026-10-19
updated: 2026-10-19
sources: ["[[Fonte - Multi-Agent Systems Architect Agent]]"]
tags: ["multi-agente", "seguranca"]
---

# Conceito - Least Privilege e Escopo de Permissões de Agentes

## Síntese corrente
Cada agente recebe **apenas** as ferramentas e dados que o seu papel exige — nada mais. O princípio de privilégio mínimo é aplicado com matriz de acesso explícita, identidade por instância, tokens de escopo que **nunca** trafegam entre agentes, sandbox de execução e log de auditoria de toda chamada de ferramenta.

## Matriz de acesso (exemplo)
| Papel | Web Search | Código | File Write | API externa | DB Read | DB Write |
|---|---|---|---|---|---|---|
| Researcher | sim | não | não | read-only | sim | não |
| Analyst | não | sim (sandbox) | não | não | sim | não |
| Writer | não | não | sim (só rascunhos) | não | não | não |
| Publisher | não | não | sim | sim (publicar) | não | sim (só status) |
| Orchestrator | não | não | não | não | sim | sim (task ledger) |

## Modelo de autorização
- **Identidade**: cada instância tem ID único + rótulo de papel; mensagens inter-agente incluem o ID do remetente e o destino valida a origem.
- **Tokens de escopo**: concedem só o acesso permitido àquele agente — **não são repassados**.
- **Sandbox**: execução de código em ambiente isolado; filesystem restrito a diretórios designados; rede em allowlist (não aberta).
- **Audit log**: toda chamada registra agente, ferramenta, entradas, saídas e timestamp — não negociável em produção.

## Conexões
- [[Conceito - Defesa contra Prompt Injection]] · [[Conceito - Observabilidade Multi-Hop e RCA]] · [[Conceito - Especialização e Contratos de Agentes]] · [[Conceito - Human-in-the-Loop Gates]]
- Hub: [[Entidade - Multi-Agent Systems Architect]]

## Fontes
- [[Fonte - Multi-Agent Systems Architect Agent]]
