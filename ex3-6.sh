#!/bin/bash

echo "=========================================="
echo "ex3-6: Python 실행파일 호출"
echo "=========================================="
echo ""

# Python 실행파일이 있는지 확인
if [ ! -f "./test_program.py" ]; then
    echo "❌ test_program.py 파일이 없습니다."
    exit 1
fi

# 인자가 있으면 그대로 전달, 없으면 기본값 사용
if [ $# -ge 2 ]; then
    echo "전달할 인자: $@"
    echo ""
    ./test_program.py "$@"
else
    echo "기본 인자로 실행: arg1 arg2 arg3"
    echo ""
    ./test_program.py arg1 arg2 arg3
fi

echo ""
echo "=========================================="
