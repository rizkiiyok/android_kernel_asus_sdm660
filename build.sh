#!/bin/bash

export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER="Sonal"
export KBUILD_BUILD_HOST="FireDragonKing"
export CROSS_COMPILE=/home/ubuntu/ether/gcc64/bin/aarch64-linux-android-
export KBUILD_COMPILER_STRING=$(/home/ubuntu/ether/clang/bin/clang --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')


mkdir -p out

make clean
make mrproper

make O=out ARCH=arm64 etherious_defconfig

make -j$(nproc --all) O=out ARCH=arm64 \
                        CC="/home/ubuntu/ether/clang/bin/clang" \
                        CLANG_TRIPLE="aarch64-linux-gnu-"
