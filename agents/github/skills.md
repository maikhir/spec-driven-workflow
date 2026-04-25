# GitHub Agent Skills

## Pull Request erstellen

**Skill: PR-Body aus Review-Reports zusammenstellen**
```
1. Lies architecture.md → extrahiere Status + Findings-Liste
2. Lies security.md → extrahiere Status + Findings-Liste
3. Lies test.md → extrahiere Status + Findings-Liste
4. Fülle PR-Body-Template mit den extrahierten Daten
5. Kürze lange Findings auf maximal 2 Sätze pro Finding
```

**Skill: Pull Request anlegen**
```
mcp__github__create_pull_request:
  owner:  github.owner
  repo:   github.repo
  title:  "[Step {N}] {step_label}"
  head:   "{branch_name}"
  base:   "{base_branch}"
  body:   <befülltes Template>
  draft:  false

Gibt zurück: { number, html_url }
```

---

## Issues erstellen

**Skill: Finding-Issue strukturieren**
```
Pro CRITICAL/MAJOR Finding:
  title: "[{SEVERITY}][Step {N}] {kurzer Finding-Titel}"
  body:  |
    ## Finding
    {vollständige Finding-Beschreibung aus Review-Report}

    ## Empfehlung
    {Empfehlung aus Review-Report}

    ## Kontext
    - Step: {N} — {step_label}
    - Review-Typ: {architecture | security | test}
    - Branch: {branch_name}
```

**Skill: Issue anlegen**
```
mcp__github__create_issue:
  owner:  github.owner
  repo:   github.repo
  title:  <strukturierter Titel>
  body:   <strukturierter Body>
  labels: ["review-finding", "step-{N}", "{severity}"]

Gibt zurück: { number, html_url }
```

---

## Referenzen zurückgeben

Nach jeder Operation gibt der Agent dem Orchestrator zurück:
```
{
  "type": "pr" | "issue",
  "number": <number>,
  "url": "<html_url>"
}
```
Der Orchestrator speichert diese Referenzen in `state/workflow.json → github.refs`.
