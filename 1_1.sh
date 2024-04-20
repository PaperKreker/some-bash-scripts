#!/bin/bash

# Создаем директорию attachments, если она не существует
mkdir -p attachments

# Цикл для скачивания 20 фотографий
for ((i=1; i<=20; i++))
do
    # Генерируем случайное число для разнообразия изображений
    random_width=$(( (RANDOM % 1000) + 400 ))
    random_height=$(( (RANDOM % 600) + 300 ))
    
    # Скачиваем изображение и сохраняем его в файл
    curl "https://picsum.photos/$random_width/$random_height" -L > attachments/image_$i.jpg
    
    echo "Скачано изображение $i"
done

echo "Скачивание завершено"
