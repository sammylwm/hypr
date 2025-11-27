#!/bin/bash

# Проверяем, что передан ровно один аргумент
if [ "$#" -ne 1 ]; then
    echo "Использование: $0 <аргумент>"
    exit 1
fi

case "$1" in
    caelestia)
        ~/hypr/scripts/caelestia_install.sh
        ;;
    end4)
        ~/hypr/scripts/end4_install.sh
        ;;
    vpn)
        ~/hypr/scripts/vpn_install.sh
        ;;
    *)
        echo "Допустимые значения: caelestia, end4"
        exit 1
        ;;
esac

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

