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

Gute Aufteilung:
  - Steps bauen aufeinander auf (klare Reihenfolge)
  - Jeder Step ist unabhängig testbar
  - Kein Step ist zu groß für einen einzelnen Coding-Aufruf
```

**Skill: Abhängigkeiten kartieren**
```
Interface-Kontrakt zwischen Steps:
  Step N exportiert:  <Funktion/Klasse/Modul mit Signatur>
  Step N+1 benötigt:  <was genau aus Step N>
  Step N+1 exportiert: <Funktion/Klasse/Modul mit Signatur>

Regel: Step N+1 darf NICHTS aus Step N+2 importieren.
```

---

## Dateistruktur planen

**Skill: Verzeichnisstruktur definieren**
```
Vollständige Struktur angeben — keine Auslassungen.
Jede Datei mit ihrer Zuständigkeit annotieren:

  src/
    module-a.{ext}    → [Zuständigkeit aus Step 1]
    module-b.{ext}    → [Zuständigkeit aus Step 2]
  tests/
    module-a.test.{ext}  → [Tests für Step 1]
  <config-files>
```

---

## Definition of Done

**Skill: DoD formulieren**
```
DoD muss messbar sein:
  NICHT: "Modul funktioniert"
  SONDERN: "Funktion X implementiert und exportiert,
            Test-File Y hat Testabdeckung für Z,
            Build läuft fehlerfrei durch"

Format:
  - [ ] Funktion X implementiert und exportiert
  - [ ] Test-File Y hat Test-Cases für Z
  - [ ] Kein Build-Fehler
  - [ ] Alle Tests grün
```

---

## Projekt-Setup

**Skill: Toolchain aus Design ableiten**
```
Folgende Entscheidungen aus outputs/design.md entnehmen:
  - Programmiersprache und Version
  - Build-Tool / Compiler
  - Test-Framework
  - Paket-Manager
  - Abhängigkeiten (nur die im Design genannten)

Alle Konfigurationsdateien (package.json, tsconfig.json, pyproject.toml, etc.)
vollständig mit Inhalt im Plan angeben — der Coding Agent soll nichts raten müssen.
```
