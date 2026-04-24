# Human Feedback Template: Spec-Writer Output

> Der Orchestrator zeigt dieses Template nach Abschluss des Spec-Writers.
> Der User beantwortet die Fragen — dann entscheidet der Orchestrator ob er weitermacht.

---

## Zu reviewen: `outputs/spec.md`

**Öffne die Datei und prüfe:**

### Vollständigkeit
- [ ] Alle Features aus `specs/spec_outline.md` sind als REQ-* Anforderungen erfasst
- [ ] Keine offensichtlich vergessenen Edge Cases
- [ ] Glossar enthält alle projektspezifischen Begriffe

### Klarheit
- [ ] Jede Anforderung ist eindeutig formuliert (kein Interpretationsspielraum)
- [ ] Keine Anforderung enthält "und" (doppelte Anforderungen)
- [ ] Nicht-funktionale Anforderungen sind messbar

### Offene Punkte
- [ ] Alle offenen Punkte aus der Outline sind adressiert
- [ ] Empfehlungen sind konkret (nicht "könnte X oder Y sein")

---

## Feedback-Optionen

**Option A — Freigabe:**
> "Spec ist OK. Weiter mit Designer."

**Option B — Kleinere Anpassung:**
> "Bitte ändere folgendes: [konkrete Änderung]"
> Der Orchestrator ruft den Spec-Writer mit deinem Feedback erneut auf.

**Option C — Größere Überarbeitung:**
> "Die Spec muss komplett überarbeitet werden. Probleme: [Liste]"

---

## Wichtige Fragen zur Klärung

Die Spec-Outline hatte diese offenen Fragen. Wurden sie beantwortet?

1. Soll der HTML-Output CSS-Styling enthalten oder plain sein?
   Antwort in Spec: ___

2. Wie werden verschachtelte Listen behandelt?
   Antwort in Spec: ___

3. Fehlerverhalten bei ungültigem Markdown?
   Antwort in Spec: ___

---

*Schreibe dein Feedback direkt als Antwort — der Orchestrator verarbeitet es.*
