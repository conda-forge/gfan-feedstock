#!/bin/bash

export CPPFLAGS="-DNOCDDPREFIX $CPPFLAGS"
export LDFLAGS="$LDFLAGS -lcddgmp -lgmp -lm"
export CFLAGS="-g -fPIC $CFLAGS"
export CXXFLAGS="-DNOCDDPREFIX -g -fPIC -std=c++2a $CXXFLAGS"

if [[ "$CXX" == *"clang"* ]]; then
  export CXXFLAGS="$CXXFLAGS -fexperimental-library"
fi

if [[ "$target_platform" != "osx-arm64" ]]; then
  export CXXFLAGS="$CXXFLAGS -D_64BITLONGINT"
fi

make -j${CPU_COUNT} cddnoprefix=yes
make PREFIX="$PREFIX" install
