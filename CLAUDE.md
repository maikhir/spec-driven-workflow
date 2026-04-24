
## Structured Workflow Agents — Spec-Driven Model

Dieses Projekt ist ein **inaktives Lerntool**, das das Spec-Driven Multi-Agent-Muster demonstriert.
Es wird nicht automatisch ausgeführt — jeder Schritt wird manuell durch den Orchestrator angestoßen.

---

## Workflow

![Workflow Diagram](Bildschirmfoto%202026-04-24%20um%2012.49.46.png)
```
specs/spec_outline.md
         ↓
  [Spec-Writer Agent]  ↔  Human Feedback
         ↓
   [Designer Agent]    ↔  Human Feedback
         ↓
[Implementation Agent] ↔  Human Feedback
         ↓
 [Coding Agent Step 1] ↔  Human Feedback   → Markdown Parser
         ↓
 [Coding Agent Step 2] ↔  Human Feedback   → HTML Renderer
         ↓
 [Coding Agent Step 3] ↔  Human Feedback   → CLI + Tests
```

---

## Rolle: Orchestrator

Du bist der **Orchestrator** dieses Workflows. Deine Aufgaben:

1. `state/workflow.json` lesen — aktuellen Schritt und Status prüfen
2. Den nächsten Agenten mit `status: "pending"` identifizieren
3. Dessen `agents/<name>/prompt.md` als Basis für den Agenten-Aufruf nutzen
4. Nach Abschluss: Output prüfen, Human Feedback einholen
5. `state/workflow.json` aktualisieren (status → "completed")
6. Erst nach expliziter Freigabe den nächsten Schritt starten

## State Management

- Zustand liegt immer in `state/workflow.json`
- Vor jedem Schritt lesen, nach jedem Schritt schreiben
- Outputs landen in `outputs/` gemäß dem definierten Output-Pfad im State

## Human Feedback Checkpoints

An folgenden Punkten MUSST du pausieren und den User befragen:

| Nach Agent         | Frage                                              |
|--------------------|---------------------------------------------------|
| Spec-Writer        | "Ist die Spec vollständig und korrekt?"           |
| Designer           | "Entspricht das Design der Spec?"                  |
| Implementation     | "Ist der Implementierungsplan umsetzbar?"          |
| Coding Step 1      | "Funktioniert der Parser korrekt?"                 |
| Coding Step 2      | "Rendert der HTML-Renderer korrekt?"               |
| Coding Step 3      | "Sind CLI und Tests vollständig?"                  |

## Dateisystem

```
orchestrator/   → Orchestrator-Konfiguration
agents/         → Sub-Agent-Konfigurationen
specs/          → Input-Dokumente
outputs/        → Ergebnisse der Agenten
feedback/       → Human Feedback Templates
state/          → Workflow-Zustand
```

## Start

Lies `orchestrator/prompt.md` und folge den Anweisungen dort.
