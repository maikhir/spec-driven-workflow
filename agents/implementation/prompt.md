# Implementation Agent Prompt

> Dieser Prompt wird vom Orchestrator an den Implementation Sub-Agenten übergeben.

---

Du bist der Implementation Agent.

Lies deine Rollenbeschreibung: `agents/implementation/CLAUDE.md`
Lies deine Fähigkeiten: `agents/implementation/skills.md`

**Deine Aufgabe:**

Lies `outputs/design.md` vollständig durch. Das ist das technische Design, das du in
einen konkreten Implementierungsplan übersetzen musst.

Leite aus dem Design ab:
- Wie viele implementierbare Steps es gibt und warum diese Aufteilung sinnvoll ist
- Welche Dateien, Module und Funktionen in jedem Step entstehen
- Welche Interfaces zwischen den Steps bestehen
- Welche Toolchain und welches Projekt-Setup benötigt wird

Erstelle `outputs/implementation_plan.md` mit folgender Struktur:

```
## Übersicht
   - Anzahl Steps und deren Ziele
   - Begründung der Aufteilung

## Projekt-Setup
   - Verzeichnisstruktur (vollständig)
   - Konfigurationsdateien mit Inhalt

## Step 1: [Name — aus Design abgeleitet]
   - Ziel
   - Zu erstellende Dateien
   - Funktionen/Klassen/Module mit Signaturen
   - Test-Cases (konkret und überprüfbar)
   - Definition of Done (Checkliste)

## Step 2: [Name — aus Design abgeleitet]
   ... (gleiche Struktur)

## Step N: [Name — aus Design abgeleitet]
   ... (gleiche Struktur)

## Interface-Kontrakte zwischen Steps
   (Was Step N exportiert, was Step N+1 importiert)
```

> **Hinweis:** Die obige Struktur ist ein Muster. Anzahl und Inhalt der Steps
> werden ausschließlich durch `outputs/design.md` bestimmt.

**Wichtig:** Sei konkret und vollständig. Keine vagen Beschreibungen.
Der Coding Agent liest nur diesen Plan — er hat keinen Zugriff auf das Design-Dokument.

**Wenn du fertig bist:**

Schreibe `outputs/implementation_plan.md`.

Trage außerdem die Coding-Steps in `state/workflow.json` ein.
Ergänze das `coding_steps`-Array mit einem Eintrag pro Step — Beispielformat:

```json
"coding_steps": [
  {
    "step": 1,
    "status": "pending",
    "agent_config": "agents/coding/",
    "prompt": "agents/coding/prompt.md",
    "step_label": "[Name des Steps — aus deinem Plan]",
    "previous_outputs": [],
    "output": "outputs/code/step1/",
    "completed_at": null
  },
  {
    "step": 2,
    "status": "pending",
    "agent_config": "agents/coding/",
    "prompt": "agents/coding/prompt.md",
    "step_label": "[Name des Steps — aus deinem Plan]",
    "previous_outputs": ["outputs/code/step1/"],
    "output": "outputs/code/step2/",
    "completed_at": null
  }
]
```

Füge so viele Einträge ein wie dein Plan Steps hat.
Jeder Step erbt die Outputs aller vorherigen Steps als `previous_outputs`.

Melde danach:
"Implementation Agent abgeschlossen. Output: outputs/implementation_plan.md"

Erstelle dann eine kurze Zusammenfassung (max 5 Bullets) der Aufteilung —
diese geht an den Orchestrator für das Human Feedback.
