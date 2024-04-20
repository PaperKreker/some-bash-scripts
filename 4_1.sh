#!/bin/bash

# Проверка наличия аргумента - имени файла
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Проверка существования файла
if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

# Чтение файла построчно и проверка координат
while IFS="(), " read _ latitude _ longitude _; do
    if (( $(echo "$latitude >= 50 && $latitude <= 80 && $longitude >= 20 && $longitude <= 45" | bc -l) )); then
        echo "Координаты в квадрате: ($latitude, $longitude)"
    fi
done < "$1"
