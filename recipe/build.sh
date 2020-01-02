#!/bin/bash

export CPPFLAGS="-DNOCDDPREFIX -DDISABLE_COMMENTATOR $CPPFLAGS"
export LDFLAGS="$LDFLAGS -lcddgmp -lgmp -lm"
export CFLAGS="-g -fPIC $CFLAGS"
export CXXFLAGS="-DNOCDDPREFIX -g -fPIC $CXXFLAGS"

find ${SRC_DIR} -type f -print0 | xargs -0 sed -i "s/log2/logger2/g"

make -j${CPU_COUNT}
mkdir -p "$PREFIX/bin"
cp -pf gfan "$PREFIX/bin/"
cd "$PREFIX/bin"
./gfan installlinks
