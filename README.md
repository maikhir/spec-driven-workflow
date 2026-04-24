# Spec-Driven Multi-Agent Workflow

Inaktives Lerntool. Der Workflow wird Schritt für Schritt manuell durchgespielt.
Jeder Agent hat eine klar abgegrenzte Aufgabe und gibt erst nach Human Feedback weiter.

---

## Schnellstart

### Option A — Slash Command (empfohlen)

```bash
# 1. specs/spec_outline.md für dein Projekt anpassen
#    (die Zeile "TEMPLATE-STATUS: unbearbeitet" dabei entfernen)

# 2. Claude Code im Projektverzeichnis starten
claude

# 3. Workflow starten
/project:workflow
```

Der Orchestrator prüft automatisch, ob `specs/spec_outline.md` bereits angepasst wurde —
falls nicht, stoppt er mit einem Hinweis, bevor irgendetwas ausgeführt wird.

### Option B — Manuell

```bash
# 1. In das Projektverzeichnis wechseln
cd /pfad/zu/Multi-Agent-Example

# 2. Claude Code starten (liest CLAUDE.md automatisch)
claude

# 3. Orchestrator-Prompt einfügen (Inhalt aus der Datei kopieren)
cat orchestrator/prompt.md
```

Danach den kopierten Inhalt als erste Nachricht in Claude Code eingeben.

