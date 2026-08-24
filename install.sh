#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dest="$HOME/.local/bin/dict"

mkdir -p "$(dirname "$dest")"
swiftc "$repo_dir/dict.swift" -o "$dest"
chmod 755 "$dest"

echo "Installed $dest"
