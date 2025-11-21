#!/bin/bash

DB_FILE="DB.txt"

# DB 파일이 없으면 생성
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true; do
    echo "==================="
    echo "팀원 관리 시스템"
    echo "==================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "==================="
    read -p "선택: " choice

    case $choice in
        1)
            echo "--- 팀원 정보 추가 ---"
            read -p "이름: " name
            read -p "생일 또는 전화번호: " info
            echo "[팀원] $name | $info" >> "$DB_FILE"
            echo "✅ 팀원 정보가 추가되었습니다."
            ;;
        2)
            echo "--- 팀원과 한 일 기록 ---"
            read -p "날짜 (예: 2024-11-21): " date
            read -p "팀원 이름: " name
            read -p "수행 내용: " task
            echo "[기록] $date | $name | $task" >> "$DB_FILE"
            echo "✅ 수행 내용이 기록되었습니다."
            ;;
        3)
            echo "--- 팀원 검색 ---"
            read -p "검색할 이름: " search_name
            echo ""
            echo "검색 결과:"
            grep "$search_name" "$DB_FILE" || echo "검색 결과 없음"
            ;;
        4)
            echo "--- 수행 내용 검색 ---"
            read -p "검색할 날짜 또는 키워드: " search_key
            echo ""
            echo "검색 결과:"
            grep "$search_key" "$DB_FILE" || echo "검색 결과 없음"
            ;;
        5)
            echo "종료합니다."
            echo ""
            echo "=== DB.txt 전체 내용 ==="
            cat "$DB_FILE"
            echo "======================="
            exit 0
            ;;
        *)
            echo "❌ 1-5 중 선택하세요"
            ;;
    esac
    echo ""
done
