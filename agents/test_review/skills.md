# Test Review Agent Skills

## DoD prüfen

**Skill: Definition of Done abarbeiten**
```
1. Extrahiere alle DoD-Punkte aus dem Plan (Checkliste im Step-Abschnitt)
2. Prüfe jeden Punkt einzeln gegen den Code:
   - Funktion/Modul implementiert? → suche in Code-Dateien
   - Test-Case vorhanden? → suche in Test-Dateien
   - Build-Fehler? → prüfe Syntax, Typ-Deklarationen, Imports
3. Nicht erfüllter DoD-Punkt → CRITICAL
```

## Test-Cases prüfen

**Skill: Geforderte Tests finden und bewerten**
```
1. Extrahiere alle Test-Cases aus dem Plan (konkrete Eingabe → erwartete Ausgabe)
2. Suche für jeden Test-Case einen entsprechenden Test in den Test-Dateien
3. Fehlender Test-Case → CRITICAL
4. Test vorhanden, prüft aber falsches Verhalten → MAJOR
   (z.B. Test prüft nur "kein Error" statt den tatsächlichen Rückgabewert)
```

## Test-Qualität prüfen

**Skill: Aussagekräftige Assertions erkennen**
```
Guter Test:
  - Hat konkrete Eingabe (nicht nur Mocks ohne Bedeutung)
  - Prüft den tatsächlichen Rückgabewert oder Seiteneffekt
  - Hat eine klare Fehlermeldung bei Assertion-Fail

Schlechter Test (MAJOR):
  - Prüft nur dass keine Exception geworfen wird
  - Assertion ist immer true (z.B. expect(true).toBe(true))
  - Test testet das Mock, nicht das eigentliche Verhalten
```

## Edge Cases prüfen

**Skill: Im Plan geforderte Edge Cases abdecken**
```
1. Extrahiere Edge Cases aus dem Plan (leere Inputs, Null-Werte, Grenzen, etc.)
2. Prüfe ob jeder Edge Case in den Tests vorkommt
3. Fehlender Edge Case → MAJOR (wenn im Plan explizit gefordert)
```

## Test-Isolation prüfen

**Skill: Abhängigkeiten zwischen Tests finden**
```
Warnsignale:
  - Globaler State der zwischen Tests geteilt wird (ohne Reset)
  - Tests die in einer bestimmten Reihenfolge laufen müssen
  - Shared Fixtures die von einem Test modifiziert werden

Severity: MAJOR — kann zu Flaky Tests führen
```
