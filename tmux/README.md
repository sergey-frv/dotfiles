# tmux

Ставится через stow в `~/.config/tmux/tmux.conf`. Базой служит стоковый конфиг
Omarchy, поверх него плагины (resurrect + continuum для сохранения сессий).

## Новое устройство (Omarchy)

```bash
cd ~/dotfiles
rm -f ~/.config/tmux/tmux.conf     # копия стокового конфига Omarchy, если есть
stow tmux
```

Первый запуск tmux сам клонирует TPM в `~/.config/tmux/plugins/tpm` и ставит
плагины. Если статус-бар пустой, нажать `prefix + I`.

Статус-бар стоковый, из Omarchy. Сторонний omarchy-tmux (powerkit) не нужен.

## Что не делать

`omarchy refresh tmux` заменяет `~/.config/tmux/tmux.conf` стоковым файлом и
сносит симлинк stow. После него: `rm ~/.config/tmux/tmux.conf && stow tmux`.

## Горячие клавиши сессий

- `prefix + C-s` сохранить, `prefix + C-r` восстановить (resurrect)
- автосохранение раз в 15 минут, восстановление при старте сервера (continuum)
