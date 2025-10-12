#!/bin/bash
echo "🧰 Copying all dotfiles..."
for dir in ./dotfiles/*; do
    name=$(basename "$dir")
    target="$HOME/.config/$name"
    [ -d "$target" ] && rm -rf "$target"
    cp -r "$dir" "$target"
done
hyprctl reload >/dev/null 2>&1

