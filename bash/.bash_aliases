# Функция для копирования файлов в буфер обмена для мессенджеров
cpfile() {
  if [ -z "$1" ]; then
    echo "Ошибка: Укажите имя файла. Пример: cpfile photo.png"
    return 1
  fi
  if [ ! -f "$1" ]; then
    echo "Ошибка: Файл '$1' не найден."
    return 1
  fi
  echo -n "file://$(realpath "$1")" | wl-copy --type text/uri-list
  echo "Файл '$(basename "$1")' скопирован в буфер обмена!"
}
