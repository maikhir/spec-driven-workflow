# Spec-Writer Skills

## Requirements Analysis

**Skill: Outline in Anforderungen übersetzen**
```
Für jede grobe Feature-Beschreibung in der Outline:
  1. Formuliere als User Story: "Als <Rolle> möchte ich <Aktion>, damit <Ziel>"
  2. Leite daraus atomare Anforderungen ab (eine Sache pro Anforderung)
  3. Nummeriere: REQ-001, REQ-002, ...
  4. Prüfe auf Vollständigkeit: Gibt es Edge Cases, die nicht erwähnt sind?
```

**Skill: Anforderungen klassifizieren**
```
Kategorie 1 — Muss (Core):       Ohne diese Features ist das Tool wertlos
Kategorie 2 — Soll (Important):  Wichtig aber nicht blockierend
Kategorie 3 — Kann (Nice-to-have): Schön, aber v2 reicht
```

---

## Offene Punkte behandeln

**Skill: Ambiguität erkennen**
```
Frage bei jeder Anforderung: "Kann jemand das anders interpretieren?"
Falls ja → Offener Punkt mit Empfehlung:
  OPEN-001: [Frage] — Empfehlung: [konkrete Antwort mit Begründung]
```

**Skill: Empfehlungen formulieren**
```
Empfehlung = Konkrete Option + Begründung (1-2 Sätze)
Nicht: "Es könnte X oder Y sein"
Sondern: "Empfehlung: X, weil Y. Alternativ Z wenn [Bedingung]."
```

---

## Dokumentstruktur

**Skill: Spec-Dokument aufbauen**
```
# [Projektname] — Spezifikation v1.0

## 1. Projektziel
## 2. Zielgruppe und Kontext
## 3. Funktionale Anforderungen
   ### 3.1 Core Features (Muss)
   ### 3.2 Important Features (Soll)
## 4. Nicht-funktionale Anforderungen
## 5. Abgrenzung (Out of Scope)
## 6. Offene Punkte
## 7. Glossar
```

---

## Qualitätsprüfung

**Skill: Spec reviewen**
```
Checkliste vor Abgabe:
  [ ] Jede Anforderung hat eine eindeutige ID
  [ ] Keine Anforderung enthält "und" (sonst aufteilen)
  [ ] Alle Outline-Items sind addressiert
  [ ] Offene Punkte haben Empfehlungen
  [ ] Glossar enthält alle projektspezifischen Terme
```
