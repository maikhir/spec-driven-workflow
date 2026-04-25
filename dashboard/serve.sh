#!/bin/bash
# Startet den Dashboard-Server vom Projekt-Root aus.
# Öffnet http://localhost:8080/dashboard/ im Browser.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$PROJECT_ROOT"

PORT=8080
echo "──────────────────────────────────────────"
echo "  Spec-Driven Workflow Dashboard"
echo "  URL: http://localhost:${PORT}/dashboard/"
echo "  Projekt: $PROJECT_ROOT"
echo "  Beenden: Ctrl+C"
echo "──────────────────────────────────────────"

# Öffne Browser (macOS)
if command -v open &>/dev/null; then
  sleep 0.5 && open "http://localhost:${PORT}/dashboard/" &
fi

python3 -m http.server $PORT
