#!/bin/bash
# Startet einen neuen Feature-Zyklus im Spec-Driven Workflow.
#
# Was passiert:
#   1. Aktuelle outputs/ werden archiviert (outputs/archive/feature_N/)
#   2. state/workflow.json wird zurückgesetzt (alle Steps → pending)
#   3. coding_steps wird geleert
#   4. current_step wird auf "code_analysis" gesetzt
#   5. GitHub-Refs werden zurückgesetzt (Konfiguration bleibt)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
STATE_FILE="$PROJECT_ROOT/state/workflow.json"
OUTPUTS_DIR="$PROJECT_ROOT/outputs"
ARCHIVE_DIR="$OUTPUTS_DIR/archive"

# ── Prüfungen ──────────────────────────────────────────────────────────────

if [ ! -f "$STATE_FILE" ]; then
  echo "Fehler: $STATE_FILE nicht gefunden."
  exit 1
fi

if ! command -v python3 &>/dev/null; then
  echo "Fehler: python3 wird benötigt."
  exit 1
fi

# ── Archiv-Nummer bestimmen ────────────────────────────────────────────────

mkdir -p "$ARCHIVE_DIR"
FEATURE_NUM=1
while [ -d "$ARCHIVE_DIR/feature_$FEATURE_NUM" ]; do
  FEATURE_NUM=$((FEATURE_NUM + 1))
done
ARCHIVE_TARGET="$ARCHIVE_DIR/feature_$FEATURE_NUM"

# ── Bestätigung ────────────────────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Spec-Driven Workflow — Neues Feature starten"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  Aktuelle outputs/ werden archiviert nach:"
echo "  outputs/archive/feature_$FEATURE_NUM/"
echo ""
echo "  Dann wird der Workflow zurückgesetzt:"
echo "  • Alle Steps → pending"
echo "  • coding_steps → []"
echo "  • current_step → code_analysis"
echo "  • GitHub-Konfiguration bleibt erhalten"
echo ""
read -r -p "  Fortfahren? [j/N] " CONFIRM
echo ""

if [[ ! "$CONFIRM" =~ ^[jJyY]$ ]]; then
  echo "  Abgebrochen."
  exit 0
fi

# ── Archivieren ────────────────────────────────────────────────────────────

echo "  [1/2] Archiviere outputs/ → outputs/archive/feature_$FEATURE_NUM/ ..."
mkdir -p "$ARCHIVE_TARGET"

# Kopiere alles außer dem archive-Verzeichnis selbst
for item in "$OUTPUTS_DIR"/*/; do
  name=$(basename "$item")
  if [ "$name" != "archive" ]; then
    cp -r "$item" "$ARCHIVE_TARGET/"
  fi
done
# Kopiere Dateien direkt in outputs/
for item in "$OUTPUTS_DIR"/*.md; do
  [ -f "$item" ] && cp "$item" "$ARCHIVE_TARGET/"
done

echo "  ✓ Archiv erstellt: outputs/archive/feature_$FEATURE_NUM/"

# ── workflow.json zurücksetzen ─────────────────────────────────────────────

echo "  [2/2] Setze state/workflow.json zurück ..."

python3 - "$STATE_FILE" <<'PYEOF'
import json, sys
from datetime import date

path = sys.argv[1]
with open(path) as f:
    data = json.load(f)

# Steps zurücksetzen
for step_name in data.get("steps", {}):
    data["steps"][step_name]["status"] = "pending"
    data["steps"][step_name]["completed_at"] = None

# Coding Steps leeren
data["coding_steps"] = []

# current_step auf code_analysis
data["current_step"] = "code_analysis"

# last_updated
data["last_updated"] = date.today().isoformat()

# GitHub-Refs zurücksetzen (Konfiguration bleibt)
if "github" in data and "refs" in data["github"]:
    data["github"]["refs"] = {
        "milestone_id": None,
        "step_issues": {},
        "step_branches": {},
        "step_prs": {}
    }

with open(path, "w") as f:
    json.dump(data, f, indent=2, ensure_ascii=False)
    f.write("\n")

print(f"  ✓ workflow.json zurückgesetzt")
PYEOF

# ── Abschluss ──────────────────────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Fertig. Nächste Schritte:"
echo ""
echo "  1. specs/spec_outline.md für das neue Feature anpassen"
echo "  2. Workflow starten: /workflow"
echo ""
echo "  Der Code-Analysis Agent analysiert zuerst den"
echo "  bestehenden Code und gibt dem Spec-Writer Kontext."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
