#!/bin/bash

# Проверяем, существует ли директория attachments
if [ -d "attachments" ]; then
    # Удаляем все файлы из директории attachments
    rm -f attachments/*
    
    echo "Изображения успешно удалены"
else
    echo "Директория attachments не существует или пуста"
fi
