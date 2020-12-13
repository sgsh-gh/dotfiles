#! /bin/sh

cd "$(dirname "$0")" || exit
packages="$(git rev-parse --show-cdup | head -1)/packages"

echo "Prepareing krew..."
kubectl krew version >/dev/null 2>&1 || (echo "Please install krew" && exit 1)
kubectl krew version >/dev/null 2>&1 && kubectl krew update
kubectl krew upgrade

xargs kubectl krew install <"$packages/krew.txt"
