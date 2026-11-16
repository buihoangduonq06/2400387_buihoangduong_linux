#!/bin/bash
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DATA_DIR="$BASE_DIR/data"
BACKUP_DIR="$BASE_DIR/backup"
LOG_FILE="$BASE_DIR/logs/backup.log"
mkdir -p "$BACKUP_DIR" "$(dirname "$LOG_FILE")"
THOI_GIAN=$(date '+%Y-%m-%d %H:%M:%S')
FILE_NAME="backup_$(date '+%Y%m%d_%H%M%S').tar.gz"
FILE_PATH="$BACKUP_DIR/$FILE_NAME"
if [ ! -d "$DATA_DIR" ]; then
    echo "[$THOI_GIAN] $FILE_NAME | THAT BAI (Thieu thu muc data)" >> "$LOG_FILE"
    echo "Sao luu that bai"
    exit 1
fi
if tar -czf "$FILE_PATH" -C "$BASE_DIR" data 2>/dev/null; then
    echo "[$THOI_GIAN] $FILE_NAME | THANH CONG" >> "$LOG_FILE"
    echo "Sao luu thanh cong: $FILE_PATH"
else
    echo "[$THOI_GIAN] $FILE_NAME | THAT BAI" >> "$LOG_FILE"
    echo "Sao luu that bai"
fi
ls -lh "$BACKUP_DIR"
echo "Tong so file sao luu: $(ls -1 "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | wc -l)"
