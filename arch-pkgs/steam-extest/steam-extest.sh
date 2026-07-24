#!/bin/sh
set -eu

file=/usr/bin/steam

if [ ! -f "$file" ]; then
    exit 0
fi

if grep -q '^export LD_PRELOAD=/usr/lib32/libextest.so$' "$file"; then
    exit 0
fi

tmp="$(mktemp)"

{
    IFS= read -r shebang
    printf '%s\n' "$shebang"
    printf 'export LD_PRELOAD=/usr/lib32/libextest.so\n'
    cat
} < "$file" > "$tmp"

install -m 755 "$tmp" "$file"
rm -f "$tmp"

