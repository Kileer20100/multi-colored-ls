# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

# Enable color support for ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Яркая цветовая схема для LS_COLORS
# Сначала создаем файл с цветами
cat > ~/.dircolors << 'EOF'
# Яркая цветовая схема
NORMAL 00
RESET 0
DIR 01;34              # Жирный синий для папок
LINK 01;36             # Жирный бирюзовый для ссылок
MULTIHARDLINK 00
FIFO 40;33             # Трубы
SOCK 01;35             # Сокеты (жирный фиолетовый)
DOOR 01;35
BLK 40;33;01           # Блочные устройства
CHR 40;33;01           # Символьные устройства
ORPHAN 40;31;01
SETUID 37;41           # SUID файлы
SETGID 30;43           # SGID файлы
STICKY_OTHER_WRITABLE 30;42
OTHER_WRITABLE 34;42
STICKY 37;44
SUID 37;41

# Архивы (Желтые и оранжевые)
.tar 01;93
.tgz 01;93
.gz 01;93
.bz2 01;93
.zip 01;93
.rar 01;93
.7z 01;93
.xz 01;93
.zst 01;93
.arc 01;93
.iso 01;93
.dmg 01;93
.deb 01;93
.rpm 01;93
.bin 01;93

# Изображения (Яркие зеленые)
.jpg 01;32
.jpeg 01;32
.png 01;32
.gif 01;32
.bmp 01;32
.svg 01;32
.webp 01;32
.ico 01;32
.tiff 01;32
.tif 01;32
.psd 01;32
.ai 01;32
.eps 01;32

# Видео (Розовые и фиолетовые)
.mp4 01;95
.avi 01;95
.mkv 01;95
.mov 01;95
.webm 01;95
.flv 01;95
.wmv 01;95
.mpeg 01;95
.mpg 01;95
.3gp 01;95

# Аудио (Яркие голубые)
.mp3 01;96
.wav 01;96
.flac 01;96
.ogg 01;96
.aac 01;96
.m4a 01;96
.wma 01;96
.opus 01;96

# Код (Стилизация под логотипы языков)
# Веб
.html 01;38;5;208      # Оранжевый для HTML
.css 01;38;5;27        # Синий для CSS
.js 01;38;5;226        # Желтый для JavaScript
.jsx 01;38;5;27
.ts 01;38;5;27         # Синий для TypeScript
.tsx 01;38;5;27
.php 01;38;5;129       # Фиолетовый для PHP
.py 01;38;5;33         # Синий для Python
.json 01;38;5;250      # Светло-серый
.xml 01;38;5;246       # Серый

# C-подобные
.c 01;38;5;208         # Оранжевый для C
.cpp 01;38;5;27        # Синий для C++
.h 01;38;5;27
.hpp 01;38;5;27
.java 01;38;5;208      # Оранжевый для Java
.cs 01;38;5;129        # Фиолетовый для C#
.go 01;38;5;39         # Ярко-синий для Go
.rs 01;38;5;166        # Оранжево-красный для Rust

# Скрипты
.sh 01;38;5;226        # Желтый для Shell-скриптов
.bash 01;38;5;226
.zsh 01;38;5;226
.ps1 01;38;5;27        # Синий для PowerShell
.pl 01;38;5;27         # Синий для Perl
.rb 01;38;5;160        # Красный для Ruby
.lua 01;38;5;27        # Синий для Lua

# Другие языки
.swift 01;38;5;208
.kt 01;38;5;166
.scala 01;38;5;160
.clj 01;38;5;160
.hs 01;38;5;208
.dart 01;38;5;27
.R 01;38;5;27

# Документы (Бирюзовые и светлые)
.pdf 01;96
.doc 01;96
.docx 01;96
.xls 01;96
.xlsx 01;96
.ppt 01;96
.pptx 01;96
.txt 00;37
.md 01;96
.tex 01;96

# Конфигурационные файлы (Яркие желтые)
.conf 01;93
.config 01;93
.yml 01;93
.yaml 01;93
.ini 01;93
.cfg 01;93
.toml 01;93

# Исполняемые файлы (Жирные белые на красном фоне)
.exe 01;37;41
.out 01;37;41
.run 01;37;41
.app 01;37;41
.bin 01;37;41

EOF

# Обновляем цвета
eval "$(dircolors -b ~/.dircolors)"

# Полезные алиасы
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

unset rc
