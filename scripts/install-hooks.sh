#!/bin/sh
# Use repo's git hooks (e.g. pre-commit for version bump). Run once after clone.

cd "$(git rev-parse --show-toplevel)" || exit 1
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit 2>/dev/null || true
echo "Git hooks installed. Pre-commit will bump patch version on each commit."
