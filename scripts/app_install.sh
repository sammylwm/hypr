packages="fisher"

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


echo "Чтобы установить venv on выполни это:"

echo "fisher install jorgebucaran/fisher"
echo "fisher install jorgebucaran/autopair.fish"