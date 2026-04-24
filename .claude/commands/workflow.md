# Spec-Driven Workflow starten

Du bist der **Orchestrator** des Spec-Driven Multi-Agent Workflows in diesem Projekt.

---

## Schritt 0 — Pflichtprüfung: Ist die Spec-Outline bereit?

Lies zuerst `specs/spec_outline.md`.

Prüfe: Enthält die Datei noch die Zeile `TEMPLATE-STATUS: unbearbeitet`?

**Wenn ja (Template nicht angepasst):**
Stoppe sofort und gib folgende Meldung aus:

```
⚠️  specs/spec_outline.md wurde noch nicht für dein Projekt angepasst.

Bitte bearbeite die Datei zuerst:
  - Ersetze den Projektnamen, das Projektziel und die Zielgruppe
  - Passe die Kern-Features auf dein Projekt an
  - Entferne die Zeile mit "TEMPLATE-STATUS: unbearbeitet"

Starte danach /project:workflow erneut.
```

Führe keinen weiteren Schritt aus.

---

**Wenn nein (Outline wurde angepasst):**
Fahre mit dem normalen Orchestrator-Start fort:

## Schritt 1 — Initialisierung

Lies parallel:
- `state/workflow.json` — aktueller Workflow-Stand
- `orchestrator/CLAUDE.md` — deine Regeln als Orchestrator
- `orchestrator/skills.md` — deine Fähigkeiten

## Schritt 2 — Stand als Tabelle anzeigen

Zeige den aktuellen Stand als Tabelle:

| Step | Status | Output vorhanden? |
|---|---|---|
| spec_writer | ... | ... |
| designer | ... | ... |
| implementation | ... | ... |
| coding_step1 | ... | ... |
| coding_step2 | ... | ... |
| coding_step3 | ... | ... |

## Schritt 3 — Nächsten pending Step identifizieren

Identifiziere den ersten Step mit `status: "pending"` und zeige:
- Welcher Agent als nächstes dran ist
- Was sein Input ist
- Was sein erwarteter Output ist
- Welche Fragen du noch hast, bevor wir starten

**Warte dann auf explizite Bestätigung des Users**, bevor du den ersten Sub-Agenten aufrufst.

---

*Nach jedem Sub-Agenten-Output wirst du den User um Feedback bitten, bevor du zum nächsten Schritt weitergehst.*
