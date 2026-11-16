#!/bin/bash

export CPPFLAGS="$CPPFLAGS -DNOCDDPREFIX -DDISABLE_COMMENTATOR -DGMPRATIONAL -I$PREFIX/include/cddlib -Wno-return-type"
export LDFLAGS="$LDFLAGS -lcddgmp -lgmp -lm -lpthread"
export CXXFLAGS="$CXXFLAGS -g -fPIC -std=c++20"

if [[ "$(uname)" == "Darwin" ]]; then
  # We need experimental-library to get ::seq and ::par
  export CXXFLAGS="$CXXFLAGS -fexperimental-library"
fi

make -j${CPU_COUNT}
mkdir -p "$PREFIX/bin"
cp -pf gfan "$PREFIX/bin/"
cd "$PREFIX/bin"
gfan installlinks
