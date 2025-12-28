#!/usr/bin/env bash
set -e

CHANGED=$(git status --porcelain | awk '{print $2}' | grep -E '\.(c|cc|cpp)$' || true)

if [ -z "$CHANGED" ]; then
    echo "🌙 nothing changed"
    exit 0
fi

echo "⚡ changed sources:"
echo "$CHANGED"
echo

for f in $CHANGED; do
    obj="${f%.*}.o"
    echo "🧹 removing $obj"
    rm -f "$obj"
done

echo
echo "🧠 rebuilding with debug symbols..."
make -j$(nproc) OPTFLAGS="-g -O0"

