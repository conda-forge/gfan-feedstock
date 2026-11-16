#!/bin/bash

export CPPFLAGS="$CPPFLAGS -DNOCDDPREFIX -DDISABLE_COMMENTATOR -DGMPRATIONAL -I$PREFIX/include/cddlib -Wno-return-type"
export LDFLAGS="$LDFLAGS -lcddgmp -lgmp -lm -lpthread"
export CXXFLAGS="$CXXFLAGS -g -fPIC -std=c++20"

if [[ "$target_platform" == "osx-64" ]]; then
  find ${SRC_DIR}/src -type f -print0 | xargs -0 sed -i '' "s/log2/logger2/g"
fi

make -j${CPU_COUNT}
mkdir -p "$PREFIX/bin"
cp -pf gfan "$PREFIX/bin/"
cd "$PREFIX/bin"
gfan installlinks
