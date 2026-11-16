#!/bin/bash
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DATA_FILE="$BASE_DIR/data/sinhvien.txt"
if [ ! -f "$DATA_FILE" ]; then
    echo "Khong tim thay file $DATA_FILE"
    exit 1
fi
while true; do
    echo "===== CHUONG TRINH QUAN LY SINH VIEN ====="
    echo "1. Hien thi danh sach sinh vien"
    echo "2. Tim kiem sinh vien theo ma"
    echo "3. Thong ke sinh vien dat va khong dat"
    echo "4. Tinh diem trung binh"
    echo "5. Hien thi sinh vien co diem cao nhat"
    echo "6. Sap xep sinh vien theo diem giam dan"
    echo "0. Thoat chuong trinh"
    read -r -p "Nhap lua chon: " chon
    case "$chon" in
        1) awk -F',' '{printf "%-8s | %-20s | %.1f\n", $1, $2, $3}' "$DATA_FILE" ;;
        2) read -r -p "Nhap ma SV: " ma; grep -i "^${ma}," "$DATA_FILE" || echo "Khong tim thay" ;;
        3) awk -F',' 'BEGIN{d=0;k=0}{if($3>=5)d++;else k++}END{print "Dat:",d,"| Khong dat:",k}' "$DATA_FILE" ;;
        4) awk -F',' '{t+=$3;n++}END{printf "Diem trung binh: %.2f\n", t/n}' "$DATA_FILE" ;;
        5) awk -F',' 'NR==1{m=$3}$3>m{m=$3}{d[NR]=$3;l[NR]=$0}END{for(i=1;i<=NR;i++)if(d[i]==m)print l[i]}' "$DATA_FILE" ;;
        6) sort -t',' -k3,3nr "$DATA_FILE" ;;
        0) exit 0 ;;
        *) echo "Lua chon khong hop le" ;;
    esac
done
