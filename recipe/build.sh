#!/bin/bash

export CPPFLAGS="-I$PREFIX/include -DNOCDDPREFIX -DDISABLE_COMMENTATOR $CPPFLAGS"
export LDFLAGS="-L$PREFIX/lib -lcddgmp -lgmp -lm $LDFLAGS"
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export CFLAGS="-O2 -g -fPIC $CFLAGS"
export CXXFLAGS="-I$PREFIX/include -DNOCDDPREFIX -O2 -g -fPIC -std=c++0x $CXXFLAGS"

make
mkdir -p "$PREFIX/bin"
cp -pf gfan "$PREFIX/bin/"
cd "$PREFIX/bin"
./gfan installlinks
