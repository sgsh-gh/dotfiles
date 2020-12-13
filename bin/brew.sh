#!/usr/bin/env bash

cd "$(dirname "$0")" || exit

echo "Prepareing homebrew..."
xcode-select --install >/dev/null 2>&1 || true
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
which brew >/dev/null 2>&1 && brew update
brew upgrade

HOMEBREW_BUNDLE_CASK_SKIP="java8" \
	brew bundle --global
