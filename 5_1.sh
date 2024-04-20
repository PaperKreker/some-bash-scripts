#!/bin/bash

# Запрашиваем название сокета с клавиатуры
echo "Введите название сокета:"
read socket_name

# Создаем файловый сокет
socat -d -d UNIX-LISTEN:"$socket_name",reuseaddr,fork EXEC:"echo $socket_name received"
