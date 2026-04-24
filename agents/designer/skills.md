# Designer Skills

## Architektur

**Skill: Komponenten identifizieren**
```
Für jede Gruppe von Anforderungen aus der Spec:
  1. Identifiziere eine kohärente Verantwortlichkeit
  2. Benenne die Komponente (Substantiv, klar)
  3. Beschreibe in einem Satz: "Diese Komponente ist zuständig für X"
  4. Liste ihre Public-Interface Methoden auf
  5. Liste ihre Abhängigkeiten auf (welche anderen Komponenten braucht sie?)
```

**Skill: ASCII-Architekturdiagramm**
```
Zeige Datenfluss zwischen Komponenten:

  [Input] → [Komponente A] → [Komponente B] → [Output]
                  ↓
            [Komponente C]

Pfeile = Datenfluss, keine Vererbung
```

---

## Datenstrukturen

**Skill: Kern-Typen definieren**
```
Für Markdown-to-HTML:
  - Token-Typen (was der Parser erzeugt)
  - AST-Node-Typen (was der Tree enthält)
  - Render-Optionen (was der Renderer akzeptiert)

Format: TypeScript-Interfaces (als Design-Illustration, nicht finaler Code)
```

**Skill: Datenfluss verfolgen**
```
Tracing von Input zu Output durch alle Typen:
  string (raw markdown)
  → Token[] (nach Tokenizer)
  → ASTNode (nach Parser)
  → string (nach Renderer, HTML)
```

---

## Algorithmen

**Skill: Algorithmus in Pseudocode**
```
Für jeden Kern-Algorithmus:
  1. Name und Zweck
  2. Input/Output-Typen
  3. Pseudocode (deutsch oder englisch, konsistent)
  4. Edge Cases explizit nennen
```

---

## Implementierungsreihenfolge

**Skill: Dependency-Graph aufbauen**
```
Topologische Sortierung der Komponenten:
  1. Was hat keine Abhängigkeiten? → Zuerst implementieren (Step 1)
  2. Was hängt nur von Step 1 ab? → Step 2
  3. Was hängt von Step 1+2 ab? → Step 3
  ...
```
