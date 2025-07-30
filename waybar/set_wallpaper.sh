#!/bin/bash

# Папка с обоями
WALL_DIR="$HOME/hypr/wallpaper"

# Выбрать случайный файл изображения
WALL=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Проверка на случай, если картинок нет
if [[ -z "$WALL" ]]; then
    echo "❌ Нет обоев в $WALL_DIR"
    exit 1
fi

# Установить обои через swww
swww img "$WALL" --transition-type grow --transition-pos 0.5,0.5

# Генерация цветов через pywal
wal -i "$WALL" -n -q

# Создать colors.css для Waybar
cat > ~/.config/waybar/colors.css <<EOF
/* Авто-сгенерировано через pywal */

@define-color background #$(jq -r .special.background ~/.cache/wal/colors.json);
@define-color foreground #$(jq -r .special.foreground ~/.cache/wal/colors.json);
@define-color color0     #$(jq -r .colors.color0     ~/.cache/wal/colors.json);
@define-color color1     #$(jq -r .colors.color1     ~/.cache/wal/colors.json);
@define-color color2     #$(jq -r .colors.color2     ~/.cache/wal/colors.json);
@define-color color3     #$(jq -r .colors.color3     ~/.cache/wal/colors.json);
@define-color color4     #$(jq -r .colors.color4     ~/.cache/wal/colors.json);
@define-color color5     #$(jq -r .colors.color5     ~/.cache/wal/colors.json);
@define-color color6     #$(jq -r .colors.color6     ~/.cache/wal/colors.json);
@define-color color7     #$(jq -r .colors.color7     ~/.cache/wal/colors.json);
EOF

# Перезапустить Waybar
pkill waybar
waybar &

# Вывод текущей картинки (опционально)
notify-send "Обои обновлены" "$WALL"
