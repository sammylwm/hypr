#!/bin/bash
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"
STATE_FILE="$HOME/.cache/caelestia_wallpaper_index"

# если файла нет — начинаем с 0
[ -f "$STATE_FILE" ] || echo 0 > "$STATE_FILE"
INDEX=$(cat "$STATE_FILE")

# список файлов
FILES=("$WALLPAPERS_DIR"/*)

# ставим обои
caelestia wallpaper -f "${FILES[$INDEX]}"

# следующий индекс
INDEX=$(( (INDEX + 1) % ${#FILES[@]} ))
echo "$INDEX" > "$STATE_FILE"

