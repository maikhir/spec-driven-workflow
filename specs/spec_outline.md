

# Spec Outline: Markdown-to-HTML Tool

## Projektziel

Ein Kommandozeilen-Tool, das Markdown-Dateien in valides HTML konvertiert.

## Zielgruppe

Entwickler und technische Autoren, die Markdown-Dokumente für Web-Präsentation aufbereiten wollen.

## Kern-Features (grob)

- Markdown-Elemente in HTML konvertieren:
  - Überschriften (H1–H6)
  - Absätze
  - Fettschrift, Kursiv
  - Listen (geordnet, ungeordnet)
  - Links und Bilder
  - Code-Blöcke (inline und fenced)
  - Blockquotes
  - Horizontale Linien
- Einzelne Dateien konvertieren: `md2html input.md`
- Output in Datei schreiben: `md2html input.md -o output.html`
- Optionales HTML-Template für vollständige HTML-Dokumente

## Nicht-funktionale Anforderungen

- Geschrieben in TypeScript
- Keine externen Abhängigkeiten für den Core-Parser
- Unit-Tests mit vitest
- Ausführbar via npx oder globalem CLI-Install

## Constraints

- Kein vollständiges CommonMark-Parsing (kein GFM, keine Tabellen in v1)
- Fokus auf Lesbarkeit des Codes (Lernzweck)
- Output muss valides HTML5 sein

## Offene Fragen (für den Spec-Writer)

1. Soll der HTML-Output stylen (CSS) oder plain sein?
2. Wie soll mit verschachtelten Listen umgegangen werden?
3. Gibt es ein gewünschtes Fehlerverhalten bei ungültigem Markdown?
