# Coding Agent Skills

## Implementierung

**Skill: Plan lesen und ausführen**
```
1. Lese den Step-Abschnitt aus implementation_plan.md
2. Extrahiere: Dateien, Funktionen, Test-Cases, DoD
3. Implementiere Datei für Datei in Abhängigkeitsreihenfolge
4. Typen/Interfaces zuerst (types.ts), dann Implementierungen
```

**Skill: TypeScript-Datei aufbauen**
```
Reihenfolge pro Datei:
  1. Imports
  2. Typen/Interfaces (falls lokale)
  3. Kern-Implementierung
  4. Exports

Keine default-Exports — nur named exports.
```

---

## Testing

**Skill: vitest Test-File schreiben**
```typescript
// Struktur:
import { describe, it, expect } from 'vitest'
import { functionUnderTest } from '../src/module'

describe('ModuleName', () => {
  describe('functionName', () => {
    it('should handle [konkrete Case]', () => {
      // Arrange
      const input = ...
      // Act
      const result = functionUnderTest(input)
      // Assert
      expect(result).toEqual(...)
    })
  })
})
```

**Skill: Test-Cases aus Plan ableiten**
```
Plan sagt: "tokenize('# Heading') → HeadingToken mit level=1"
Übersetze in: expect(tokenize('# Heading')).toEqual([{ type: 'heading', level: 1, text: 'Heading' }])

Plan sagt: "Edge Case: leere Eingabe"
Übersetze in: expect(tokenize('')).toEqual([])
```

---

## Markdown Parser (Step 1 spezifisch)

**Skill: Regex-basierter Tokenizer**
```
Vorgehen:
  1. Eingabe zeilenweise aufteilen
  2. Jede Zeile gegen Pattern-Liste prüfen (in Reihenfolge der Spezifizität)
  3. Erste Übereinstimmung = Token-Typ
  4. Token mit extrahierten Daten zurückgeben

Pattern-Reihenfolge:
  - Headings (###, ##, #) — vor Paragraph prüfen
  - Horizontal Rule (---)
  - Blockquote (>)
  - List items (-, *, 1.)
  - Code fence (```)
  - Leerzeile (→ paragraph break)
  - Alles andere → Paragraph-Text
```

---

## HTML Renderer (Step 2 spezifisch)

**Skill: AST zu HTML**
```
Vorgehen:
  1. Für jeden AST-Node: entsprechendes HTML-Tag wählen
  2. Rekursiv Children rendern
  3. Inline-Formatting (bold, italic, links) via Regex auf Text-Nodes

Sicherheit:
  - User-Text mit escapeHtml() absichern (< > & " → HTML entities)
  - Keine rohe String-Interpolation für User-Content
```

---

## CLI (Step 3 spezifisch)

**Skill: Node.js CLI aufbauen**
```
process.argv[2] = input file path
process.argv[3] = "-o" flag
process.argv[4] = output file path (optional)

Wenn kein -o: Output auf stdout
Fehlerbehandlung:
  - File not found → stderr + exit(1)
  - Kein Argument → usage hint + exit(1)
```
