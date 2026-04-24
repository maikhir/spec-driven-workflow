# Coding Agent — Step {STEP_NUMBER}

> Dieser Prompt wird vom Orchestrator für jeden Coding-Step aufgerufen.
> Der Orchestrator ersetzt die Platzhalter {STEP_NUMBER}, {PREVIOUS_OUTPUTS}
> und {OUTPUT_PATH} mit den Werten aus `state/workflow.json`.

---

Du bist der Coding Agent, Step {STEP_NUMBER}.

Lies deine Rollenbeschreibung: `agents/coding/CLAUDE.md`
Lies deine Fähigkeiten: `agents/coding/skills.md`

**Deine Aufgabe:**

Lies `outputs/implementation_plan.md`, Abschnitt "Step {STEP_NUMBER}".
Dieser Abschnitt definiert vollständig, was du implementieren musst —
Dateien, Funktionen, Tests und die Definition of Done.

{PREVIOUS_OUTPUTS}

Folge dem Plan präzise. Schreibe deinen Output nach `{OUTPUT_PATH}`.

**Vorgehen:**
1. Lies den Step-{STEP_NUMBER}-Abschnitt im Implementierungsplan vollständig
2. Lies alle unter "Vorherige Outputs" aufgeführten Dateien (Interfaces, Typen, Exports)
3. Verstehe die Definition of Done — das ist dein Fertigkeitskriterium
4. Implementiere alle im Plan gelisteten Dateien und Funktionen
5. Schreibe die im Plan definierten Tests
6. Stelle sicher, dass alle Tests durchlaufen und kein Build-Fehler vorliegt

**Wenn du fertig bist:**
Schreibe alle Dateien nach `{OUTPUT_PATH}` und melde:
"Coding Step {STEP_NUMBER} abgeschlossen. Output: {OUTPUT_PATH}"

Liste alle erstellten Dateien und den Status von Build und Tests.
