#!/bin/bash

echo "=========================================="
echo "ex3-3: 점수를 A/B 등급으로 변환"
echo "=========================================="
echo ""

# 등급 변환 함수
get_grade() {
    score=$1
    if [ $score -ge 90 ]; then
        echo "A"
    else
        echo "B"
    fi
}

# 점수 배열 및 등급 배열
scores=()
grades=()

echo "점수를 입력하세요 (0~100 범위, 2개 이상)"
echo "종료하려면 'done' 입력"
echo ""

count=0

# 점수 입력 받기
while true; do
    read -p "과목 $((count+1)) 점수: " input
    
    # 종료 조건
    if [ "$input" = "done" ]; then
        if [ $count -lt 2 ]; then
            echo "⚠️  최소 2개 이상의 점수를 입력해야 합니다. (현재 ${count}개)"
            continue
        else
            break
        fi
    fi
    
    # 숫자 확인
    if ! [[ $input =~ ^[0-9]+$ ]]; then
        echo "❌ 0~100 사이의 정수를 입력하세요."
        continue
    fi
    
    # 범위 확인
    if [ $input -lt 0 ] || [ $input -gt 100 ]; then
        echo "❌ 점수는 0~100 범위여야 합니다."
        continue
    fi
    
    # 점수와 등급 저장
    scores[$count]=$input
    grade=$(get_grade $input)
    grades[$count]=$grade
    
    echo "   → 점수: $input, 등급: $grade"
    count=$((count + 1))
done

echo ""
echo "=========================================="
echo "입력된 점수와 등급"
echo "=========================================="

# 각 과목별 점수와 등급 출력
total_score=0
for i in "${!scores[@]}"; do
    score=${scores[$i]}
    grade=${grades[$i]}
    echo "과목 $((i+1)): ${score}점 → 등급 ${grade}"
    total_score=$((total_score + score))
done

echo ""
echo "=========================================="
echo "평균 계산"
echo "=========================================="

# 평균 점수 계산
avg=$(echo "scale=2; $total_score / $count" | bc)
echo "총점: ${total_score}점"
echo "과목 수: ${count}개"
echo "평균 점수: ${avg}점"

# 평균 등급 계산
avg_int=$(echo "$avg / 1" | bc)  # 정수로 변환
avg_grade=$(get_grade $avg_int)
echo "평균 등급: ${avg_grade}"

echo "=========================================="
