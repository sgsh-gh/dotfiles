#! /bin/sh

cd "$(dirname "$0")" || exit

pyenv --version >/dev/null 2>&1 || exit

# TODO: investigate error for 3.6.12
l='3.6.8 3.7.9 3.8.6 3.9.0'
for v in $l; do
	echo "Installing Python$v..."
	CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" \
	LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib" \
		pyenv install "$v" --skip-existing
done
pyenv rehash
