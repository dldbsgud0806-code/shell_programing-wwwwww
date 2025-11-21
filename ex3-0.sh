#!/bin/bash

echo "=========================================="
echo "ex3-0: 환경변수 설정 및 확인"
echo "=========================================="

# 1. .bashrc 파일에 환경변수 추가
echo ""
echo "1. .bashrc 파일에 MYENV 환경변수 추가 중..."
echo 'export MYENV="Hello Shell"' >> ~/.bashrc

# 변경사항 즉시 적용
source ~/.bashrc

echo "   ✅ 환경변수 추가 완료"
echo ""

# 2. 환경변수 확인
echo "2. 환경변수 확인:"
echo "   MYENV = $MYENV"
echo ""

# 3. 새로운 셸에서도 유지되는지 확인
echo "3. 새로운 셸에서 환경변수 확인:"
bash -c 'echo "   MYENV = $MYENV"'
echo ""

# 4. 환경변수 해제
echo "4. 환경변수 해제 테스트:"
unset MYENV
echo "   환경변수 해제 후: MYENV = $MYENV"
echo "   (비어있으면 정상)"
echo ""

# 5. 새로운 셸에서는 여전히 유지됨 (.bashrc에 등록되어 있으므로)
echo "5. 새로운 셸에서는 여전히 유지됨 확인:"
bash -c 'echo "   MYENV = $MYENV"'
echo ""

echo "=========================================="
echo "💡 참고: .bashrc에 등록되었으므로"
echo "   새 터미널을 열면 자동으로 MYENV가 설정됩니다"
echo "=========================================="
