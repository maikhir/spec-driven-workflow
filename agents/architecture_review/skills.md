# Architecture Review Agent Skills

## Dateistruktur prüfen

**Skill: Plan vs. Code abgleichen**
```
1. Extrahiere die Dateiliste aus dem Plan (Abschnitt "Zu erstellende Dateien")
2. Liste alle tatsächlich erstellten Dateien in {CODE_PATH} auf
3. Prüfe: Fehlt eine Pflicht-Datei? → CRITICAL
4. Prüfe: Gibt es unerwartete Dateien? → MINOR (dokumentieren)
```

## Interface-Kontrakte prüfen

**Skill: Signaturen vergleichen**
```
1. Extrahiere alle Interface-Kontrakte aus dem Plan ("Interface-Kontrakte zwischen Steps")
2. Suche die entsprechenden Exports im Code (export-Statements, public APIs)
3. Prüfe Name, Parameter-Typen, Return-Typen — exakte Übereinstimmung erforderlich
4. Fehlt ein Export → CRITICAL
5. Signatur weicht ab → CRITICAL
6. Nur Namenskonvention unterschiedlich → MAJOR
```

## Abhängigkeiten prüfen

**Skill: Import-Graph analysieren**
```
1. Lies alle Import-Statements in {CODE_PATH}
2. Erlaubt: Imports aus dem eigenen Step und aus vorherigen Steps (laut Plan)
3. Nicht erlaubt: Imports aus zukünftigen Steps → CRITICAL
4. Nicht erlaubt: Externe Pakete die nicht im Plan stehen → MAJOR
5. Zirkuläre Imports → CRITICAL
```

## Verantwortlichkeiten prüfen

**Skill: Single Responsibility prüfen**
```
Frage für jedes Modul: "Tut diese Datei mehr als im Plan beschrieben?"

Beispiele für Verletzungen:
  - Datentransformation in einem I/O-Modul → MAJOR
  - Business-Logik in einem Utility-Modul → MAJOR
  - Mehrere unzusammenhängende Funktionen in einer Datei → MINOR
```

## Namensgebung prüfen

**Skill: Konsistenz mit Design-Sprache**
```
1. Extrahiere verwendete Begriffe aus outputs/design.md (Ubiquitous Language)
2. Prüfe ob Funktions-, Klassen- und Dateinamen diese Begriffe verwenden
3. Abweichungen → MINOR (außer bei public APIs → MAJOR)
```
