#!/bin/bash

# 성적 저장 배열
scores=()

while true; do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "==================="
    read -p "선택: " choice

    case $choice in
        1)
            read -p "점수 입력 (0-100): " score
            if [[ $score =~ ^[0-9]+$ ]] && [ $score -ge 0 ] && [ $score -le 100 ]; then
                scores+=($score)
                echo "✅ 추가됨: $score"
            else
                echo "❌ 0-100 사이 숫자만"
            fi
            ;;
        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수 없음"
            else
                echo "입력된 점수:"
                for i in "${!scores[@]}"; do
                    echo "  과목 $((i+1)): ${scores[$i]}"
                done
            fi
            ;;
        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수 없음"
            else
                sum=0
                for score in "${scores[@]}"; do
                    sum=$((sum + score))
                done
                avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc)
                echo "평균 점수: $avg"
            fi
            ;;
        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수 없음"
            else
                sum=0
                for score in "${scores[@]}"; do
                    sum=$((sum + score))
                done
                avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc)
                avg_int=$(echo "$avg / 1" | bc)
                if [ $avg_int -ge 90 ]; then
                    gpa="A"
                else
                    gpa="B"
                fi
                echo "평균: $avg → GPA: $gpa"
            fi
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
done
