# Human Feedback Template: Implementation Agent Output

> Der Orchestrator zeigt dieses Template nach Abschluss des Implementation Agents.

---

## Zu reviewen: `outputs/implementation_plan.md`

**Öffne die Datei und prüfe:**

### Step-Aufteilung
- [ ] Jeder Step ist isoliert implementierbar (klare Grenze)
- [ ] Step 1 hat keine Abhängigkeit zu Step 2 oder 3
- [ ] Interface-Kontrakt zwischen Steps ist explizit definiert

### Vollständigkeit
- [ ] Alle Dateien sind gelistet (keine "etc.")
- [ ] Alle Funktionssignaturen sind angegeben
- [ ] Alle Test-Cases sind konkret (nicht "teste ob es funktioniert")

### Definition of Done
- [ ] Jeder Step hat eine messbare DoD
- [ ] DoD enthält TypeScript-Prüfung und Test-Anforderung

### Projekt-Setup
- [ ] package.json enthält `bin`-Eintrag für CLI
- [ ] tsconfig.json ist für NodeNext konfiguriert
- [ ] vitest ist als Test-Framework gelistet

---

## Feedback-Optionen

**Option A — Freigabe:**
> "Plan ist OK. Starte Coding Step 1."

**Option B — Anpassung:**
> "Ergänze folgendes: [konkrete Ergänzung]"

**Option C — Überarbeitung:**
> "Step-Aufteilung ist falsch weil [Begründung]. Neue Aufteilung: [Vorschlag]"

---

*Schreibe dein Feedback direkt als Antwort.*
