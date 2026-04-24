# Coding Agent Skills

## Implementierung

**Skill: Plan lesen und ausführen**
```
1. Lese den Step-Abschnitt aus implementation_plan.md
2. Extrahiere: Dateien, Funktionen/Klassen, Test-Cases, DoD
3. Implementiere Datei für Datei in Abhängigkeitsreihenfolge
4. Typen/Interfaces zuerst, dann Implementierungen, dann Tests
```

**Skill: Datei aufbauen**
```
Reihenfolge pro Datei:
  1. Imports
  2. Typen/Interfaces (falls lokal)
  3. Kern-Implementierung
  4. Exports

Keine default-Exports — nur named exports (sofern nicht anders im Plan).
```

---

## Testing

**Skill: Test-File schreiben**
```
Struktur (adaptiere ans Test-Framework aus dem Plan):

  describe('ModulName', () => {
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
Plan sagt: "funktion(input) → erwarteter Output"
Übersetze in: expect(funktion(input)).toEqual(expectedOutput)

Plan sagt: "Edge Case: leere Eingabe"
Übersetze in: expect(funktion('')).toEqual(<erwartetes Verhalten>)

Immer den tatsächlichen Rückgabewert prüfen — nicht nur "kein Error".
```

---

## Interface-Kontrakte einhalten

**Skill: Exports mit Plan abgleichen**
```
Vor dem Abschluss eines Steps:
1. Lies "Interface-Kontrakte zwischen Steps" im Implementierungsplan
2. Prüfe: Exportiert dein Code exakt die vereinbarten Signaturen?
3. Abweichungen sofort korrigieren — der nächste Step baut darauf auf
```

---

## Definition of Done prüfen

**Skill: DoD-Checkliste abarbeiten**
```
Vor der Fertigmeldung:
  - [ ] Alle im Plan gelisteten Dateien erstellt?
  - [ ] Alle geforderten Funktionen/Klassen implementiert und exportiert?
  - [ ] Alle geforderten Test-Cases vorhanden?
  - [ ] Build fehlerfrei?
  - [ ] Alle Tests grün?

Erst wenn alles checked: Fertigmeldung an den Orchestrator.
```
