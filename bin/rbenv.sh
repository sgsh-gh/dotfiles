#! /bin/sh

cd "$(dirname "$0")" || exit

rbenv --version >/dev/null 2>&1 || exit

l='2.6.6'
for v in $l; do
	echo "Installing Ruby$v..."
	rbenv install "$v" --skip-existing
done
rbenv rehash
