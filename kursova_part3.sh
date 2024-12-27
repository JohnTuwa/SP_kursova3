#!/bin/bash

work_dir="${1:-.}"

for item in "$work_dir"/*; do
  # Перевіряємо чи елемент не є самим файлом скрипта
  if [ "$item" == "$0" ]; then
    continue
  fi

  # Отримуємо ім'я елементу без шляху
  base_item=$(basename "$item")

  if [ -d "$item" ]; then
    echo "$base_item є директорією"
  elif [ -f "$item" ]; then
    dir_name="${item}_dir"
    mkdir -p "$dir_name"
    mv "$item" "$dir_name/"
    echo "$base_item переміщений в $dir_name"
  fi
done
