# Coding Agent — Step 1: Markdown Parser

> Dieser Prompt wird vom Orchestrator für Step 1 an den Coding Sub-Agenten übergeben.

---

Du bist der Coding Agent, Step 1.

Lies deine Rollenbeschreibung: `agents/coding/CLAUDE.md`
Lies deine Fähigkeiten: `agents/coding/skills.md`

**Deine Aufgabe: Markdown Parser implementieren**

Lies `outputs/implementation_plan.md`, Abschnitt "Step 1: Markdown Parser".
Folge dem Plan präzise.

**Zu implementierende Dateien** (Output in `outputs/code/step1/`):

```
outputs/code/step1/
  src/
    types.ts          → Token-Typen, ASTNode-Typen, Options-Typen
    tokenizer.ts      → tokenize(markdown: string): Token[]
    parser.ts         → parse(tokens: Token[]): ASTNode
  tests/
    tokenizer.test.ts → Tests für alle Token-Typen
    parser.test.ts    → Tests für AST-Aufbau
  package.json        → Projekt-Setup (aus Plan)
  tsconfig.json       → TypeScript-Konfiguration (aus Plan)
```

**Pflicht-Implementierungen:**

`types.ts`:
- `TokenType` enum (alle Markdown-Elemente)
- `Token` interface
- `ASTNode` interface (mit children)
- `NodeType` enum

`tokenizer.ts`:
- `tokenize(markdown: string): Token[]`
- Unterstützt: H1-H6, Paragraph, Bold, Italic, Code (inline), Code (fence),
  Blockquote, UL-Item, OL-Item, Link, Bild, HR, Leerzeile

`parser.ts`:
- `parse(tokens: Token[]): ASTNode`
- Baut korrekten Baum (Listenstruktur gruppiert)

**Definition of Done:**
- [ ] Alle 3 Dateien kompilieren ohne TypeScript-Fehler (`tsc --noEmit`)
- [ ] tokenize('# Hello') gibt HeadingToken mit level=1 zurück
- [ ] tokenize('**bold**') gibt Token mit inline Bold-Markup zurück
- [ ] parse() gruppiert Liste-Items korrekt unter einem List-Node
- [ ] Alle Tests in tokenizer.test.ts und parser.test.ts laufen durch

**Wenn du fertig bist:**
Schreibe alle Dateien nach `outputs/code/step1/` und melde:
"Coding Step 1 abgeschlossen. Output: outputs/code/step1/"

Liste alle erstellten Dateien und ob TypeScript + Tests grüne sind.
