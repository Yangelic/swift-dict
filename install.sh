#!/bin/sh
set -eu

repo="Yangelic/swift-dict"
source_url="https://raw.githubusercontent.com/$repo/main/dict.swift"
dest="$HOME/.local/bin/dict"

if ! command -v swiftc >/dev/null 2>&1; then
    echo "error: Swift compiler not found."
    echo "Install Apple's Command Line Tools:"
    echo "  xcode-select --install"
    exit 1
fi

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM

echo "Downloading dict source..."
curl -fsSL "$source_url" -o "$tmp_dir/dict.swift"

mkdir -p "$(dirname "$dest")"
swiftc "$tmp_dir/dict.swift" -o "$dest"
chmod 755 "$dest"

echo "Installed: $dest"
