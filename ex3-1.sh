#!/bin/bash

echo "=========================================="
echo "ex3-1: 두 숫자의 사칙연산"
echo "=========================================="

# 인자 개수 확인
if [ $# -ne 2 ]; then
    echo "❌ 오류: 정확히 2개의 숫자를 입력해야 합니다."
    echo "사용법: $0 <숫자1> <숫자2>"
    echo "예시: $0 10 5"
    exit 1
fi

# 파라미터 변수로 숫자 받기
num1=$1
num2=$2

echo ""
echo "입력된 숫자:"
echo "  첫 번째 숫자: $num1"
echo "  두 번째 숫자: $num2"
echo ""

# 사칙연산 수행
echo "=========================================="
echo "사칙연산 결과 (정수):"
echo "=========================================="

# 덧셈
add=$((num1 + num2))
echo "덧셈:    $num1 + $num2 = $add"

# 뺄셈
sub=$((num1 - num2))
echo "뺄셈:    $num1 - $num2 = $sub"

# 곱셈
mul=$((num1 * num2))
echo "곱셈:    $num1 × $num2 = $mul"

# 나눗셈 (0으로 나누기 체크)
if [ $num2 -eq 0 ]; then
    echo "나눗셈:  $num1 ÷ $num2 = 오류 (0으로 나눌 수 없음)"
    echo "나머지:  $num1 % $num2 = 오류 (0으로 나눌 수 없음)"
else
    div=$((num1 / num2))
    mod=$((num1 % num2))
    echo "나눗셈:  $num1 ÷ $num2 = $div"
    echo "나머지:  $num1 % $num2 = $mod"
fi

echo "=========================================="
