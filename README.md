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

---

## Dashboard

Fortschritt des Workflows live im Browser verfolgen:

```bash
bash dashboard/serve.sh
# → öffnet http://localhost:8080/dashboard/ automatisch
```

**Was das Dashboard zeigt:**
- Pipeline-Fortschritt (alle Steps mit Status-Indikator)
- Haupt-Schritte (Spec Writer → Designer → Implementation) mit Output-Links
- Coding Steps mit Architecture-, Security- und Test-Review-Status
- GitHub-Refs (Branches, PRs, Issues) wenn GitHub-Integration aktiv ist
- Auto-Refresh alle 10 Sekunden

Voraussetzung: Python 3 (auf macOS vorinstalliert). Kein npm, kein Node.js nötig.

---

## GitHub Integration (optional)

Das Framework kann optional mit einem GitHub Repository verbunden werden.
Beim Start fragt der Orchestrator einmalig, ob die Integration aktiviert werden soll.

**Was automatisiert wird:**

| Zeitpunkt | Aktion |
|---|---|
| Nach Implementation approved | Milestone-Issue + Step-Issues anlegen |
| Vor jedem Coding Step | Feature-Branch erstellen (`step-N-{label}`) |
| Nach Reviews alle PASSED | Pull Request mit Review-Summary erstellen |
| Bei Review FAILED | Issues für CRITICAL/MAJOR Findings anlegen |

**Konfiguration** in `state/workflow.json`:
```json
"github": {
  "enabled": true,
  "owner": "dein-user",
  "repo": "dein-repo",
  "base_branch": "main"
}
```

Benötigt: [GitHub MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/github) konfiguriert in Claude Code.

