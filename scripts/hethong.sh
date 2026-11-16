#!/bin/bash
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOG_FILE="$BASE_DIR/logs/hethong.log"
mkdir -p "$(dirname "$LOG_FILE")"
{
    echo "Ngay gio hien tai : $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Ten nguoi dung    : $(whoami)"
    echo "Ten may tinh      : $(hostname)"
    echo "Linux Kernel      : $(uname -r)"
    echo "--- Dung luong RAM ---"
    free -h
    echo "--- Dung luong o dia ---"
    df -h
    echo "--- Kiem tra ket noi mang ---"
    if ping -c 2 -W 3 google.com.vn > /dev/null 2>&1; then
        echo "Co ket noi mang"
    else
        echo "Khong xac nhan duoc ket noi mang"
    fi
} 2>&1 | tee "$LOG_FILE"
