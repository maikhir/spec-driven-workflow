# Coding Agent — Step 2: HTML Renderer

> Dieser Prompt wird vom Orchestrator für Step 2 an den Coding Sub-Agenten übergeben.

---

Du bist der Coding Agent, Step 2.

Lies deine Rollenbeschreibung: `agents/coding/CLAUDE.md`
Lies deine Fähigkeiten: `agents/coding/skills.md`

**Deine Aufgabe: HTML Renderer implementieren**

Lies `outputs/implementation_plan.md`, Abschnitt "Step 2: HTML Renderer".
Lies die Typen aus `outputs/code/step1/src/types.ts` — du musst damit kompatibel sein.
Folge dem Plan präzise.

**Zu implementierende Dateien** (Output in `outputs/code/step2/`):

```
outputs/code/step2/
  src/
    renderer.ts       → render(ast: ASTNode, opts?: RenderOptions): string
    escapeHtml.ts     → escapeHtml(text: string): string
  tests/
    renderer.test.ts  → Tests für alle HTML-Outputs
```

**Pflicht-Implementierungen:**

`escapeHtml.ts`:
- `escapeHtml(text: string): string`
- Ersetzt: `<` → `&lt;`, `>` → `&gt;`, `&` → `&amp;`, `"` → `&quot;`
- Wird für ALLE User-Inhalte verwendet

`renderer.ts`:
- `render(ast: ASTNode, opts?: RenderOptions): string`
- `RenderOptions`: `{ template?: boolean, title?: string }`
- Rendert alle Node-Typen aus Step 1 zu korrektem HTML5
- Wenn `template: true` → vollständiges HTML-Dokument (`<!DOCTYPE html>` etc.)
- Inline-Formatting (bold → `<strong>`, italic → `<em>`, code → `<code>`)

**Sicherheit (Pflicht):**
- NIEMALS rohe User-Strings in HTML interpolieren
- IMMER `escapeHtml()` für Text-Inhalte aufrufen
- Link-URLs validieren (nur http/https/relative)

**Definition of Done:**
- [ ] render() erzeugt valides HTML5 für alle Node-Typen
- [ ] escapeHtml() verhindert XSS (`<script>` wird escaped)
- [ ] `template: true` erzeugt vollständiges HTML-Dokument
- [ ] Alle Tests in renderer.test.ts laufen durch
- [ ] Kein TypeScript-Fehler

**Wenn du fertig bist:**
Schreibe alle Dateien nach `outputs/code/step2/` und melde:
"Coding Step 2 abgeschlossen. Output: outputs/code/step2/"

Liste alle erstellten Dateien und ob TypeScript + Tests grüne sind.
