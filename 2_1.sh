#!/bin/bash

# Задаем размеры матриц
rows1=3
cols1=3
rows2=3
cols2=3

# Генерируем случайные матрицы и сохраняем их в файлы
python -c "import numpy as np; matrix1 = np.random.randint(0, 10, size=($rows1, $cols1)); print(matrix1)" > matrix1.txt
python -c "import numpy as np; matrix2 = np.random.randint(0, 10, size=($rows2, $cols2)); print(matrix2)" > matrix2.txt

# Функция для умножения строки матрицы на столбец
multiply_row() {
    row=$1
    for ((i=0; i<$cols2; i++)); do
        result=0
        for ((k=0; k<$cols1; k++)); do
            val1=$(sed -n "$(($row + 1))p" matrix1.txt | cut -d' ' -f$(($k + 1)))
            val2=$(sed -n "$(($k + 1))p" matrix2.txt | cut -d' ' -f$(($i + 1)))
            result=$(($result + $val1 * $val2))
        done
        echo -n "$result "
    done
    echo ""
}

export -f multiply_row

# Используем parallel для умножения матриц
parallel -j $rows1 multiply_row ::: $(seq 0 $(($rows1 - 1)))

# Удаляем временные файлы
rm matrix1.txt matrix2.txt
