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

# Список требуемых программ
packages="caelestia-shell-git caelestia-cli foot"

is_installed() {
    if pacman -Q "$1" >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

for pkg in $packages; do
    if ! is_installed "$pkg"; then
        echo "Пакет $pkg не установлен. Устанавливаю через paru..."
        paru -S --needed --noconfirm "$pkg"
    else
        echo "Пакет $pkg уже установлен."
    fi
done
