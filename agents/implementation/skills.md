# Implementation Agent Skills

## Step-Planung

**Skill: Design in Steps aufteilen**
```
Grundprinzip: Ein Step = eine abgeschlossene, testbare Einheit

Für jeden Step:
  1. Name und Ziel (ein Satz)
  2. Input: Was existiert bereits (aus vorherigen Steps)?
  3. Output: Welche Dateien/Module werden erstellt?
  4. Funktionen: Vollständige Liste mit Signaturen
  5. Tests: Welche Test-Cases?
  6. DoD: "Step ist fertig wenn..."
```

**Skill: Abhängigkeiten kartieren**
```
Interface-Kontrakt zwischen Steps:
  Step 1 exportiert: tokenize(md: string): Token[]
                     parse(tokens: Token[]): ASTNode
  Step 2 benötigt:   ASTNode (muss mit Step 1 kompatibel sein)
  Step 2 exportiert: render(ast: ASTNode, opts?: Options): string
  Step 3 benötigt:   tokenize + parse + render
```

---

## Dateistruktur planen

**Skill: Verzeichnisstruktur definieren**
```
Für Markdown-to-HTML:
  src/
    tokenizer.ts    → Step 1
    parser.ts       → Step 1
    types.ts        → Step 1 (geteilt mit Step 2)
    renderer.ts     → Step 2
    cli.ts          → Step 3
    index.ts        → Step 3 (Public API)
  tests/
    tokenizer.test.ts  → Step 1
    parser.test.ts     → Step 1
    renderer.test.ts   → Step 2
    cli.test.ts        → Step 3
    integration.test.ts → Step 3
  package.json
  tsconfig.json
```

---

## Definition of Done

**Skill: DoD formulieren**
```
DoD muss messbar sein:
  NICHT: "Parser funktioniert"
  SONDERN: "tokenize() erzeugt korrekte Token für alle 8 Markdown-Elemente,
            alle Tests in tokenizer.test.ts laufen durch"

Format:
  - [ ] Funktion X implementiert und exportiert
  - [ ] Test-File Y hat Testabdeckung für Z
  - [ ] Kein TypeScript-Fehler
```

---

## Projekt-Setup

**Skill: package.json planen**
```
Felder die definiert werden müssen:
  - name, version, description
  - main (Entry für Library-Use)
  - bin (Entry für CLI-Use)
  - scripts: build, test, lint
  - devDependencies: typescript, vitest, @types/node
  - type: "module" (ESM)
```

**Skill: tsconfig.json planen**
```
Für CLI-Tool:
  - target: ES2022
  - module: NodeNext
  - moduleResolution: NodeNext
  - outDir: dist/
  - strict: true
```
