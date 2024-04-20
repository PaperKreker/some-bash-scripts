#!/bin/bash

# Запрашиваем порт для сетевого сокета с клавиатуры
echo "Введите порт для сетевого сокета:"
read port

# Создаем сетевой сокет
socat -d -d TCP-LISTEN:$port,reuseaddr,fork EXEC:"echo $port received"
