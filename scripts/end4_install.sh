#!/bin/bash

for dir in "$HOME/hypr/end4"/*; do
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

SCRIPT_SRC="$HOME/hypr/end4/hypr/hyprland/scripts/workspaces"
if [ -f "$SCRIPT_SRC" ]; then
    sudo cp "$SCRIPT_SRC" /usr/bin/workspaces
    sudo chmod +x /usr/bin/workspaces
else
    echo "Предупреждение: скрипт workspaces не найден по пути $SCRIPT_SRC" >&2
fi