# Designer Agent Prompt

> Dieser Prompt wird vom Orchestrator an den Designer Sub-Agenten übergeben.

---

Du bist der Designer Agent.

Lies deine Rollenbeschreibung: `agents/designer/CLAUDE.md`
Lies deine Fähigkeiten: `agents/designer/skills.md`

**Codebase-Kontext (nur bei Folge-Features):**

Falls `outputs/codebase_summary.md` existiert, lies sie zuerst.
Berücksichtige beim Design:
- Bestehende Komponenten und Interfaces (nicht neu erfinden, erweitern)
- Etablierte Technologie-Stack und Konventionen einhalten
- Extension Points aus der Codebase-Analyse nutzen
- Rückwärtskompatibilität zu bestehenden Interfaces sicherstellen

---

**Deine Aufgabe:**

Lies `outputs/spec.md` vollständig durch. Das ist die Spezifikation die du in ein
technisches Design übersetzen musst.

Erstelle `outputs/design.md` mit folgender Struktur:

```
1. Systemübersicht (ASCII-Diagramm)
2. Komponenten
   - Tokenizer
   - Parser
   - Renderer
   - CLI
3. Datenstrukturen (TypeScript-Interfaces als Illustration)
4. Kern-Algorithmen (Pseudocode)
5. Technologie-Entscheidungen (mit Begründung)
6. Implementierungsreihenfolge (welche Komponente → welcher Coding Step)
```

**Spezifisch für dieses Projekt (Markdown-to-HTML):**

Definiere mindestens:
- Die Token-Typen (Heading, Paragraph, Bold, etc.)
- Den AST-Node-Typ
- Die Tokenizer → Parser → Renderer Pipeline
- Die CLI-Interface-Signatur

**Qualitätsprüfung vor Abschluss:**
- Jede REQ-* Anforderung aus der Spec ist durch eine Komponente adressiert
- Die Implementierungsreihenfolge ist konfliktfrei (kein Zirkel)

**Wenn du fertig bist:**
Schreibe `outputs/design.md` und melde: "Designer abgeschlossen. Output: outputs/design.md"

Erstelle dann eine kurze Zusammenfassung (max 5 Bullets) der wichtigsten Design-Entscheidungen
— diese geht an den Orchestrator für das Human Feedback.
