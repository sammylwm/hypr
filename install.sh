#!/bin/bash
echo "🧰 Copying all dotfiles..."
for dir in $HOME/hypr/dotfiles/*; do
    name=$(basename "$dir")
    target="$HOME/.config/$name"
    [ -d "$target" ] && rm -rf "$target"
    cp -r "$dir" "$target"
done
hyprctl reload >/dev/null 2>&1
echo "надо установить caelestia-shell-git, caelestia-cli, foot"
