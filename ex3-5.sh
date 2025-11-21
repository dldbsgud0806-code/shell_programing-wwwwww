#!/bin/bash

echo "=========================================="
echo "ex3-5: 함수로 리눅스 명령어 실행"
echo "=========================================="

# 내부 함수 정의
run_command() {
    cmd="ls $@"
    echo "실행할 명령어: $cmd"
    echo "---"
    eval $cmd
}

echo ""
echo "1. 기본 ls 실행:"
run_command

echo ""
echo "2. ls -l 실행:"
run_command -l

echo ""
echo "3. ls -la 실행:"
run_command -la

echo ""
echo "4. ls -lh 실행:"
run_command -lh

echo ""
echo "=========================================="
