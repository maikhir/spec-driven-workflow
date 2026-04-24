# Orchestrator Skills

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
