# Security Review Agent Skills

## Technologie-Kontext lesen

**Skill: Relevante Checks aus dem Plan ableiten**
```
1. Lies die Technologie aus dem Implementierungsplan (Sprache, Frameworks, Kontext)
2. Bestimme welche Kategorien relevant sind:
   - Web-Backend → Injection, Auth, Session, XSS, CSRF
   - CLI-Tool → Command Injection, Path Traversal, Argument Injection
   - Library → Input-Validierung, Unsafe Deserialization
   - Datenbankzugriff → SQL/NoSQL Injection, Zugriffskontrollen
3. Fokussiere die Prüfung auf relevante Kategorien
```

## Injection prüfen

**Skill: Unsichere Eingabeverarbeitung finden**
```
Suche nach:
  - Direkte String-Interpolation von User-Input in Queries/Commands/Templates
  - eval(), exec(), system() mit externen Inputs
  - Fehlende Parametrisierung bei Datenbankzugriffen
  - Unsichere Deserialisierung (pickle, eval, JSON mit __proto__)

Severity: CRITICAL wenn User-Input unkontrolliert in ausführbaren Kontext gelangt
```

## Secrets prüfen

**Skill: Hardcodierte Credentials finden**
```
Suche nach:
  - Strings die wie Passwörter, API-Keys, Tokens aussehen (Länge, Entropy, Präfixe)
  - Verbindungsstrings mit eingebetteten Credentials
  - Private Keys im Code

Severity: CRITICAL bei jedem Fund
```

## Ausgabe-Encoding prüfen

**Skill: XSS und Injection via Output**
```
Suche nach:
  - User-Content der ohne Encoding in HTML/XML/JSON eingefügt wird
  - Fehlende URL-Encoding bei Redirects
  - Template-Rendering ohne Auto-Escape

Severity: CRITICAL bei direkter XSS-Möglichkeit
```

## Fehlerbehandlung prüfen

**Skill: Information Leakage finden**
```
Suche nach:
  - Stack-Traces die an den Client weitergegeben werden
  - Interne Pfade, Dateinamen, Konfiguration in Fehlermeldungen
  - Unterschiedliche Fehlermeldungen die Enumeration ermöglichen

Severity: MAJOR
```

## Abhängigkeiten prüfen

**Skill: Vulnerable Packages identifizieren**
```
1. Extrahiere alle Abhängigkeiten mit Versionsnummern aus dem Plan
2. Prüfe gegen bekannte CVEs für diese Versionen (aus Wissen über gängige Schwachstellen)
3. Veraltete Major-Versionen mit bekannten Problemen → MAJOR
```
