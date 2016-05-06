#! /bin/bash
set -euo pipefail
cd /data
git clone git://github.com/OpenArena/engine.git
cd engine
VERSION_ID=$(git log -1 --date=short --format="openarena_engine_%cd_%H")
echo $VERSION_ID
STAGING_DIR=/staging/$VERSION_ID
mkdir $STAGING_DIR
make
mv /data/engine/build/release-linux-x86_64/oa_ded.x86_64 $STAGING_DIR/
mv /data/engine/build/release-linux-x86_64/openarena.x86_64 $STAGING_DIR/
mv /data/engine/build/release-linux-x86_64/renderer_*_x86_64.so $STAGING_DIR/
cd /data/engine
CC=i686-w64-mingw32-gcc ARCH=x86 PLATFORM=mingw32  make
zip -r $VERSION_ID $VERSION_ID
mv $VERSION_ID.zip /data/