# Coding Agent — Step 3: CLI + Tests

> Dieser Prompt wird vom Orchestrator für Step 3 an den Coding Sub-Agenten übergeben.

---

Du bist der Coding Agent, Step 3.

Lies deine Rollenbeschreibung: `agents/coding/CLAUDE.md`
Lies deine Fähigkeiten: `agents/coding/skills.md`

**Deine Aufgabe: CLI und Integration implementieren**

Lies `outputs/implementation_plan.md`, Abschnitt "Step 3: CLI + Integration".
Lies `outputs/code/step1/src/` und `outputs/code/step2/src/` — du integrierst beide.
Folge dem Plan präzise.

**Zu implementierende Dateien** (Output in `outputs/code/step3/`):

```
outputs/code/step3/
  src/
    cli.ts            → CLI Entry Point
    index.ts          → Public API (Library-Export)
  tests/
    cli.test.ts       → Tests für CLI-Argument-Parsing
    integration.test.ts → End-to-End Tests (md input → html output)
  fixtures/
    sample.md         → Beispiel-Markdown für Tests
    expected.html     → Erwarteter HTML-Output
```

**Pflicht-Implementierungen:**

`index.ts` (Public API):
```typescript
export { tokenize } from './step1/tokenizer'
export { parse } from './step1/parser'
export { render } from './step2/renderer'
export type { Token, ASTNode, RenderOptions } from './step1/types'

// High-Level API:
export function convert(markdown: string, opts?: RenderOptions): string
```

`cli.ts`:
```
Usage: md2html <input.md> [-o <output.html>] [--template] [--title "Title"]

Argumente:
  input.md     Pflicht — Pfad zur Markdown-Datei
  -o           Optional — Ausgabedatei (default: stdout)
  --template   Optional — vollständiges HTML-Dokument
  --title      Optional — Titel für HTML-Dokument

Exit Codes:
  0 → Erfolg
  1 → Fehler (Datei nicht gefunden, Parse-Fehler)
```

`integration.test.ts`:
- Test: `convert('# Hello')` → `'<h1>Hello</h1>'`
- Test: `convert('**bold**')` → enthält `<strong>bold</strong>`
- Test: Vollständige Markdown-Datei → korrektes HTML-Dokument
- Test: CLI mit `--template` → `<!DOCTYPE html>` im Output

**Definition of Done:**
- [ ] `npx md2html sample.md` funktioniert (Output auf stdout)
- [ ] `npx md2html sample.md -o output.html` schreibt Datei
- [ ] Alle Integration-Tests laufen durch
- [ ] CLI gibt sinnvolle Fehlermeldung bei fehlendem Input
- [ ] `convert()` ist als Library verwendbar (exportiert)
- [ ] Kein TypeScript-Fehler

**Wenn du fertig bist:**
Schreibe alle Dateien nach `outputs/code/step3/` und melde:
"Coding Step 3 abgeschlossen. Output: outputs/code/step3/"

Zeige den finalen `convert('# Hello World\n\nParagraph text.')` Output.
