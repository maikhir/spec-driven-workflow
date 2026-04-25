# Orchestrator Skills

## Multi-Feature-Workflow

**Skill: Code-Analysis-Bedingung prüfen**
```
1. Prüfe ob outputs/code/ Dateien enthält:
     find outputs/code/ -type f -not -name '.gitkeep'
2. Falls LEER:
     → code_analysis.status bleibt "skipped"
     → Nächster Step: spec_writer
3. Falls NICHT LEER und code_analysis.status = "pending":
     → Code-Analysis Agent aufrufen (agents/code_analysis/prompt.md)
     → Warte auf outputs/codebase_summary.md
     → Human Feedback einholen
     → code_analysis.status = "completed"
     → Nächster Step: spec_writer
```

**Skill: Codebase-Kontext injizieren**
```
Wenn outputs/codebase_summary.md existiert:
  Füge beim Aufruf von spec_writer und designer hinzu:
  "Lies außerdem outputs/codebase_summary.md — das ist der Ist-Stand
   des bestehenden Codes. Berücksichtige Architektur und Konventionen."
```

**Skill: Neuen Feature-Zyklus erkennen**
```
Wenn current_step = "code_analysis" UND outputs/code/ nicht leer:
  → Informiere User: "Ich starte mit Code-Analyse des bestehenden Codes."
  → Zeige was archiviert wurde (falls outputs/archive/ existiert)
  → Führe code_analysis aus
```

---

## State Management

**Skill: State lesen**
```
Lies state/workflow.json
Identifiziere current_step
Prüfe status aller Steps
```

**Skill: State schreiben**
```
Nach Human Feedback:
  - Setze <step>.status auf "completed"
  - Setze <step>.completed_at auf aktuelles Datum
  - Setze current_step auf nächsten pending Step
  - Schreibe workflow.json zurück
```

---

## Agenten-Delegation

**Skill: Sub-Agenten aufrufen**
```
1. Lade agents/<step>/prompt.md
2. Lade aktuellen Input (z.B. outputs/spec.md)
3. Kombiniere zu vollständigem Agenten-Prompt
4. Rufe Agent auf (claude code Agent-Tool)
5. Warte auf Completion
6. Prüfe ob Output-Datei existiert und nicht leer ist
```

**Skill: Agenten-Kontext aufbauen**
```
Agent-Prompt enthält:
  - Inhalt von agents/<step>/CLAUDE.md (Rolle)
  - Inhalt von agents/<step>/skills.md (Fähigkeiten)
  - Inhalt von agents/<step>/prompt.md (konkrete Aufgabe)
  - Konkreter Input-Inhalt
  - Output-Pfad-Anweisung
```

---

## Human Feedback

**Skill: Feedback einholen**
```
1. Lese feedback/<step>_feedback.md (Template)
2. Präsentiere Output-Zusammenfassung dem User
3. Zeige Feedback-Fragen aus Template
4. Warte auf Antwort
5. Bei "approved": weitermachen
6. Bei Änderungen: Sub-Agenten mit Feedback-Kontext erneut aufrufen
```

---

## Workflow-Navigation

**Skill: Nächsten Schritt bestimmen**
```
Reihenfolge: spec_writer → designer → implementation
             → coding_step1 → coding_step2 → coding_step3
Nächster Step = erster Step mit status: "pending"
```

**Skill: Fortschritt berichten**
```
Formatiere State als übersichtliche Tabelle:
  Step | Status | Output vorhanden?
Zeige nach jedem Update.
```

---

## GitHub Integration (MCP)

**Voraussetzung:** `state/workflow.json → github.enabled = true`

**Skill: GitHub-Konfiguration prüfen**
```
1. Lies github.enabled aus State
2. Falls false: User fragen ob GitHub-Integration gewünscht
3. Falls ja: owner, repo, base_branch erfragen und in State schreiben
4. Falls nein: github.enabled bleibt false, alle GitHub-Skills überspringen
```

**Skill: Milestone-Issue erstellen (nach Implementation approved)**
```
mcp__github__create_issue mit:
  - owner: github.owner
  - repo: github.repo
  - title: "[Milestone] {project}: Implementation Plan"
  - body: Liste aller coding_steps mit Beschreibung
  - labels: ["milestone", "spec-driven-workflow"]
Speichere zurückgegebene issue_number in github.refs.milestone_id
```

**Skill: Step-Issues erstellen (nach Implementation approved)**
```
Für jeden Entry in coding_steps[]:
  mcp__github__create_issue mit:
    - title: "[Step {N}] {step_label}"
    - body: Step-Beschreibung aus implementation_plan.md
    - labels: ["coding-step", "step-{N}"]
  Speichere issue_number in github.refs.step_issues["{N}"]
```

**Skill: Feature-Branch erstellen (vor Coding Step N)**
```
Branch-Name: "step-{N}-{step_label}"
  (step_label: Kleinbuchstaben, Leerzeichen → Bindestriche)
mcp__github__create_branch mit:
  - owner: github.owner
  - repo: github.repo
  - branch: branch_name
  - from_branch: github.base_branch
Speichere branch_name in github.refs.step_branches["{N}"]
```

**Skill: Pull Request erstellen (nach Reviews alle PASSED)**
```
Delegiere an GitHub Sub-Agenten (agents/github/prompt.md):
  - Übergib: step_number, step_label, branch_name, review_outputs
  - Agent erstellt PR mit strukturiertem Body
Speichere pr_number in github.refs.step_prs["{N}"]
```

**Skill: Finding-Issues erstellen (bei Review FAILED)**
```
Für jedes CRITICAL oder MAJOR Finding aus den Review-Reports:
  mcp__github__create_issue mit:
    - title: "[{Severity}][Step {N}] {Finding-Titel}"
    - body: Finding-Beschreibung + Empfehlung aus Review-Report
    - labels: ["review-finding", "step-{N}", severity.toLowerCase()]
  Optional: issue dem step_pr zuweisen falls bereits erstellt
```
