#!/bin/bash

# Создаем дочерний процесс
echo "Создаем дочерний процесс"
(sleep 5) &

# Ожидаем 10 секунд
echo "Ожидаем 10 секунд"
sleep 10

# Завершаем программу
echo "Программа завершена"