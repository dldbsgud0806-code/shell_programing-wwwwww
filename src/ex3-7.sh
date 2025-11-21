#!/bin/bash

while true; do
    echo "==================="
    echo "시스템 상태 확인"
    echo "==================="
    echo "1) 사용자 정보"
    echo "2) CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "==================="
    read -p "선택: " choice

    case $choice in
        1)
            echo "--- 사용자 정보 ---"
            echo "현재 사용자: $(whoami)"
            echo "호스트명: $(hostname)"
            echo "로그인 시간: $(who)"
            ;;
        2)
            echo "--- CPU 사용률 ---"
            top -bn1 | grep "Cpu(s)" | head -1
            echo ""
            echo "프로세스 상위 5개:"
            ps aux --sort=-%cpu | head -6
            ;;
        3)
            echo "--- 메모리 사용량 ---"
            free -h
            ;;
        4)
            echo "--- 디스크 사용량 ---"
            df -h
            echo ""
            echo "현재 디렉토리 용량:"
            du -sh .
            ;;
        5)
            echo "종료합니다."
            exit 0
            ;;
        *)
            echo "❌ 1-5 중 선택하세요"
            ;;
    esac
    echo ""
    read -p "Enter를 눌러 계속..."
    echo ""
done
