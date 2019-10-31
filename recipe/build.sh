#!/bin/bash

export CPPFLAGS="-DNOCDDPREFIX -DDISABLE_COMMENTATOR $CPPFLAGS"
export LDFLAGS="$LDFLAGS -lcddgmp -lgmp -lm"
export CFLAGS="-g -fPIC $CFLAGS"
export CXXFLAGS="-DNOCDDPREFIX -g -fPIC $CXXFLAGS"

make -j${CPU_COUNT}
mkdir -p "$PREFIX/bin"
cp -pf gfan "$PREFIX/bin/"
cd "$PREFIX/bin"
./gfan installlinks
