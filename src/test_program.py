#!/usr/bin/env python3
import sys

print("=" * 40)
print("프로그램 시작")
print("=" * 40)

print(f"입력된 인자 개수: {len(sys.argv) - 1}")
print()

if len(sys.argv) > 1:
    print("입력된 인자들:")
    for i, arg in enumerate(sys.argv[1:], 1):
        print(f"  인자 {i}: {arg}")
else:
    print("인자가 없습니다.")

print()
print("=" * 40)
print("프로그램 종료")
print("=" * 40)
