#!/bin/bash

echo "🧰 Copying all dotfiles..."

for dir in "$HOME/hypr/dotfiles"/*; do
    name=$(basename "$dir")
    target="$HOME/.config/$name"

    # Создаём целевую директорию, если её нет
    mkdir -p "$target"

    # Копируем содержимое (а не саму папку), перезаписывая только то, что есть в dotfiles
    if [ -d "$dir" ]; then
        cp -rT "$dir/" "$target/"
    else
        cp "$dir" "$target"
    fi
done

hyprctl reload >/dev/null 2>&1