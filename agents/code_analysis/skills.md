# Code-Analysis Agent Skills

## Codebase lesen

**Skill: Dateien inventarisieren**
```
1. Liste alle Dateien unter outputs/code/ rekursiv auf
2. Gruppiere nach Verzeichnis/Modul
3. Erkenne Konventionen aus Dateinamen und Verzeichnisstruktur
```

**Skill: Datei analysieren**
```
Pro Quelldatei:
  - Lies den vollständigen Inhalt
  - Identifiziere: Exports, Klassen, Funktionen (mit Signaturen)
  - Erkenne: Imports/Abhängigkeiten zu anderen Projektdateien
  - Bestimme: Welche Verantwortlichkeit hat diese Datei?
```

---

## Architektur erkennen

**Skill: Schichten-Architektur erkennen**
```
Suche nach Mustern wie:
  - Trennung von Daten, Logik, Präsentation
  - Modul-Grenzen (z.B. core/, utils/, api/, ui/)
  - Dependency-Richtung (wer importiert wen?)
```

**Skill: Technologie-Stack bestimmen**
```
Lies:
  - package.json / pyproject.toml / go.mod / Cargo.toml etc.
  - Import-Statements in Quelldateien
  - Konfigurationsdateien (tsconfig, .eslintrc, etc.)
```

---

## Integrations-Hinweise ableiten

**Skill: Extension Points identifizieren**
```
Frage dich für jede Komponente:
  - Gibt es abstrakte Interfaces / Protokolle die erweitert werden könnten?
  - Gibt es Registry-Patterns, Plugin-Points, Factory-Functions?
  - Welche Dateien werden bei neuen Features wahrscheinlich angefasst?
```

**Skill: Risiken für neue Features erkennen**
```
Prüfe:
  - Enge Kopplungen die ein neues Feature zwingen könnten Bestehendes zu ändern
  - Fehlende Abstraktion an kritischen Stellen
  - Hartkodierte Annahmen die für das nächste Feature ungültig sein könnten
```

---

## Output schreiben

**Skill: codebase_summary.md strukturieren**
```
Ziel: Ein neues Agenten-Team (Spec-Writer, Designer) soll ohne
  den vorherigen Code zu lesen verstehen:
  - Was existiert bereits?
  - Welche Konventionen gelten?
  - Wo dockt das nächste Feature an?

Format: Maximal präzise, minimal redundant.
Lieber Tabellen und Codefragmente als Prosa.
```
