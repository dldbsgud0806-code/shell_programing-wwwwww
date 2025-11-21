#!/bin/bash

echo "=========================================="
echo "ex3-2: y = (1/2)x² 계산 (실수 범위)"
echo "=========================================="
echo ""

# 함수 정의: y = (1/2)x² 계산
calculate() {
    x=$1
    # bc를 이용한 실수 계산
    # scale=2는 소수점 2자리까지 표시
    result=$(echo "scale=2; 0.5 * $x * $x" | bc)
    echo "  x = $x  →  y = (1/2)×${x}² = $result"
}

echo "수식: y = (1/2)x²"
echo ""

# 방법 1: 명령줄 인자로 입력받기
if [ $# -ge 2 ]; then
    echo "=========================================="
    echo "명령줄 인자로 입력된 값들:"
    echo "=========================================="
    
    for x in "$@"; do
        calculate $x
    done
    echo ""
fi

# 방법 2: 사용자 입력으로 받기
echo "=========================================="
echo "사용자 입력으로 계산:"
echo "=========================================="
echo "x 값을 입력하세요 (2개 이상, 종료하려면 'q' 입력):"
echo ""

count=0
while true; do
    read -p "x[$((count+1))] = " input
    
    # 종료 조건
    if [ "$input" = "q" ] || [ "$input" = "Q" ]; then
        if [ $count -lt 2 ]; then
            echo "⚠️  최소 2개 이상의 값을 입력해야 합니다. 현재 ${count}개"
            continue
        else
            break
        fi
    fi
    
    # 숫자 확인 (정수 또는 실수)
    if [[ $input =~ ^-?[0-9]+\.?[0-9]*$ ]]; then
        calculate $input
        count=$((count + 1))
    else
        echo "❌ 유효한 숫자를 입력하세요."
    fi
done

echo ""
echo "=========================================="
echo "총 ${count}개의 값을 계산했습니다."
echo "=========================================="
