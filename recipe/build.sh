#!/bin/bash

export CPPFLAGS="-DNOCDDPREFIX -I$PREFIX/include/cddlib $CPPFLAGS"
export LDFLAGS="$LDFLAGS -lcddgmp -lgmp -lm"
export CFLAGS="-g -fPIC -I$PREFIX/include/cddlib $CFLAGS"
export CXXFLAGS="-DNOCDDPREFIX -I$PREFIX/include/cddlib -g -fPIC -std=c++2a $CXXFLAGS"

if [[ "$CXX" == *"clang"* ]]; then
  export CXXFLAGS="$CXXFLAGS -fexperimental-library"
fi

if [[ "$target_platform" == linux-* ]]; then
  export CXXFLAGS="$CXXFLAGS -D_64BITLONGINT"
fi

make -j${CPU_COUNT} cddnoprefix=yes
make PREFIX="$PREFIX" install
