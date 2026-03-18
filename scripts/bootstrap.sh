#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is required but was not found in PATH." >&2
  exit 1
fi

echo "Installing dependencies..."
npm install

echo
echo "Done. Start the dev server with:"
echo "  npm run dev -- --host 0.0.0.0"
