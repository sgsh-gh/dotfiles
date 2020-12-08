#! /bin/sh

cd "$(dirname "$0")" || exit

# TODO: investigate why this returns 1
# jenv doctor >/dev/null 2>&1 || exit 1

l='1.8 11'
for v in $l; do
  echo "Adding Java$v..."
  jenv add "$(/usr/libexec/java_home -v "$v")"
done
