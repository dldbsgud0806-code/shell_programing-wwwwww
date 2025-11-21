#!/bin/bash

echo "=========================================="
echo "ex3-8: 파일 및 폴더 관리"
echo "=========================================="
echo ""

# 1. DB 폴더 확인 및 생성
echo "1. DB 폴더 확인 및 생성"
if [ -d "DB" ]; then
    echo "✅ DB 폴더가 이미 존재합니다."
else
    mkdir DB
    echo "✅ DB 폴더를 생성했습니다."
fi
echo ""

# 2. DB 폴더에 5개 파일 생성
echo "2. DB 폴더에 5개 파일 생성"
cd DB
for i in {1..5}; do
    echo "This is file $i" > file$i.txt
    echo "   생성됨: file$i.txt"
done
echo ""

# 3. 파일 목록 확인
echo "3. 생성된 파일 목록:"
ls -lh *.txt
echo ""

# 4. 파일 압축
echo "4. 파일 압축 중..."
tar -czf files.tar.gz *.txt
echo "✅ files.tar.gz 생성 완료"
ls -lh files.tar.gz
echo ""

# 5. train 폴더 생성
echo "5. train 폴더 생성"
cd ..
if [ -d "train" ]; then
    echo "✅ train 폴더가 이미 존재합니다."
else
    mkdir train
    echo "✅ train 폴더를 생성했습니다."
fi
echo ""

# 6. DB의 파일들을 train에 심볼릭 링크
echo "6. DB 파일들을 train 폴더에 링크"
cd train
for i in {1..5}; do
    ln -sf ../DB/file$i.txt file$i.txt
    echo "   링크됨: file$i.txt -> ../DB/file$i.txt"
done
echo ""

# 7. 링크 확인
echo "7. train 폴더의 링크 확인:"
ls -lh
echo ""

# 8. 링크된 파일 내용 확인
echo "8. 링크된 파일이 제대로 작동하는지 확인:"
cat file1.txt
echo ""

cd ..
echo "=========================================="
echo "완료!"
echo "DB 폴더: $(pwd)/DB"
echo "train 폴더: $(pwd)/train"
echo "=========================================="
