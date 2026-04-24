# Implementation Agent Prompt

> Dieser Prompt wird vom Orchestrator an den Implementation Sub-Agenten übergeben.

---

Du bist der Implementation Agent.

Lies deine Rollenbeschreibung: `agents/implementation/CLAUDE.md`
Lies deine Fähigkeiten: `agents/implementation/skills.md`

**Deine Aufgabe:**

Lies `outputs/design.md` vollständig durch. Das ist das technische Design das du in
einen konkreten Implementierungsplan übersetzen musst.

Erstelle `outputs/implementation_plan.md` mit folgender Struktur:

```
## Projekt-Setup
   - Verzeichnisstruktur (vollständig)
   - package.json Inhalt
   - tsconfig.json Inhalt

## Step 1: Markdown Parser
   - Ziel
   - Dateien: src/types.ts, src/tokenizer.ts, src/parser.ts
   - Funktionsliste mit Signaturen
   - Test-Cases (konkret, z.B. "## Heading → HeadingToken mit level=2")
   - Definition of Done (Checkliste)

## Step 2: HTML Renderer
   - Ziel
   - Dateien: src/renderer.ts
   - Funktionsliste mit Signaturen
   - Test-Cases
   - Definition of Done

## Step 3: CLI + Integration
   - Ziel
   - Dateien: src/cli.ts, src/index.ts
   - CLI-Interface (Argumente, Flags, Error-Codes)
   - Integration Tests
   - Definition of Done

## Interface-Kontrakte zwischen Steps
   (Was Step 1 exportiert, was Step 2 importiert, etc.)
```

**Wichtig:** Sei konkret und vollständig. Keine vagen Beschreibungen.
Der Coding Agent liest nur diesen Plan — er hat keinen Zugriff auf das Design-Dokument.

**Wenn du fertig bist:**
Schreibe `outputs/implementation_plan.md` und melde:
"Implementation Agent abgeschlossen. Output: outputs/implementation_plan.md"

Erstelle dann eine kurze Zusammenfassung (max 5 Bullets) der Aufteilung —
diese geht an den Orchestrator für das Human Feedback.
