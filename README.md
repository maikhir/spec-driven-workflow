# Spec-Driven Multi-Agent Workflow

Generisches Spec-Driven Workflow Framework für Multi-Agent-Software-Entwicklung.
Jeder Agent hat eine klar abgegrenzte Aufgabe und gibt erst nach Human Feedback weiter.
Spec → Design → Implementierungsplan → Code (mit Architecture, Security und Test Review nach jedem Schritt).

---

## Schnellstart

### Option A — Slash Command (empfohlen)

```bash
# 1. specs/spec_outline.md für dein Projekt anpassen
#    (die Zeile "TEMPLATE-STATUS: unbearbeitet" dabei entfernen)

# 2. Claude Code im Projektverzeichnis starten
claude

# 3. Workflow starten
/workflow
```

Der Orchestrator prüft automatisch, ob `specs/spec_outline.md` bereits angepasst wurde —
falls nicht, stoppt er mit einem Hinweis, bevor irgendetwas ausgeführt wird.

### Option B — Manuell

```bash
# 1. In das Projektverzeichnis wechseln
cd /pfad/zu/spec-driven-workflow

# 2. Claude Code starten (liest CLAUDE.md automatisch)
claude

# 3. Orchestrator-Prompt einfügen (Inhalt aus der Datei kopieren)
cat orchestrator/prompt.md
```

Danach den kopierten Inhalt als erste Nachricht in Claude Code eingeben.

