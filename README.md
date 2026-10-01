# My Sway Dotfiles

Минималистичная конфигурация Sway для Ubuntu.

## Что используется

- Sway — оконный менеджер
- Waybar — верхняя панель
- Foot — терминал
- Fuzzel — запуск приложений
- Mako — уведомления
- gtklock — экран блокировки
- swayidle — автоматическая блокировка
- Grim + Slurp — скриншоты
- wl-clipboard — работа с буфером обмена
- pavucontrol — управление звуком

## Установка

Клонировать репозиторий:

```bash
git clone <URL-РЕПОЗИТОРИЯ> ~/dotfiles
cd ~/dotfiles
```

Запустить установку:

```bash
chmod +x install.sh
./install.sh
```

После установки выйти из текущей сессии и выбрать Sway на экране входа.

Для NVIDIA в установщике создаётся отдельная сессия:

```text
Sway (NVIDIA)
```

Она запускает Sway с параметром:

```bash
sway --unsupported-gpu
```

## Основные хоткеи

| Хоткей | Действие |
| --- | --- |
| `Super + Enter` | Открыть терминал |
| `Super + D` | Fuzzel |
| `Super + Q` | Закрыть окно |
| `Super + F` | Полноэкранный режим |
| `Super + L` | Заблокировать экран |
| `Super + S` | Выбрать область и скопировать скриншот |
| `Super + R` | Режим изменения размера окон |
| `Super + 1..9` | Переключить workspace |
| `Super + Shift + 1..9` | Переместить окно на workspace |
| `Super + стрелки` | Переключать фокус между окнами |
| `Super + Shift + стрелки` | Перемещать окна |
| `Alt + Shift` | Переключить EN/RU |

## Скриншоты

`Super + S` запускает Slurp для выбора области.

Grim делает скриншот, после чего `wl-copy` помещает PNG прямо в буфер обмена.

После этого изображение можно вставить через:

```text
Ctrl + V
```

## Структура

```text
dotfiles/
├── sway/
│   └── config
├── waybar/
│   ├── config.jsonc
│   └── style.css
├── foot/
│   └── foot.ini
├── fuzzel/
│   └── fuzzel.ini
├── mako/
│   └── config
├── gtklock/
│   ├── config.ini
│   └── style.css
├── bin/
│   └── powermenu
├── packages.txt
├── install.sh
└── README.md
```

## Внешний вид

Основной стиль максимально простой:

- тёмный фон `#111111`
- минимальные рамки окон
- небольшие gaps
- тёмный Waybar
- минимум визуальных эффектов
- управление в основном с клавиатуры

Waybar показывает:

- workspaces
- CPU
- RAM
- текущую раскладку
- сеть
- громкость
- дату и время

## Конфиги

После установки файлы располагаются в:

```text
~/.config/sway/
~/.config/waybar/
~/.config/foot/
~/.config/fuzzel/
~/.config/mako/
~/.config/gtklock/
```

Power menu:

```text
~/.local/bin/powermenu
```

## Примечание про NVIDIA

Конфигурация используется с проприетарным драйвером NVIDIA.

Sway официально предупреждает о проприетарном драйвере, поэтому для запуска используется:

```bash
sway --unsupported-gpu
```

Если используется AMD, Intel или Nouveau, отдельная NVIDIA-сессия обычно не требуется.
