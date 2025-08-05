#!/bin/bash

# Проверяем статус bluetooth
if systemctl is-active --quiet bluetooth; then
    # Проверяем есть ли подключённые устройства
    connected=$(bluetoothctl info | grep "Connected: yes")

    if [ -n "$connected" ]; then
        icon=""  # иконка Bluetooth с подключением (Nerd Font)
        status="On"
    else
        icon=""  # иконка Bluetooth без подключения
        status="On"
    fi
else
    icon=""    # иконка Bluetooth выключен
    status="Off"
fi

echo "$status"
