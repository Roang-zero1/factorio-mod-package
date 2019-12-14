#!/bin/sh

cd $INPUT_MOD_BASE_DIR

export PACKAGE_NAME=$(jq -r .name info.json)
export PACKAGE_VERSION=$(jq -r .version info.json)
export PACKAGE_FULL_NAME=$PACKAGE_NAME\_$PACKAGE_VERSION
export PACKAGE_FILE="$PACKAGE_FULL_NAME.zip"

echo "Creating Package for $PACKAGE_NAME in version $PACKAGE_VERSION"

export BUILD_DIR=.build
export OUTPUT_DIR=$BUILD_DIR/$PACKAGE_FULL_NAME

export PNG_FILES="$(find ./graphics -iname '*.png' -type f)"

echo 'Copying package files'

rm -rf .build dist
mkdir -p $OUTPUT_DIR

for F in $(find . \
  -type d \
  \( \
  -iname 'locale' -o \
  -iname 'sounds' \
  \)); do
  cp -r --parents $F $OUTPUT_DIR;
done

for F in $(find . \
  -iname '*.md' -o \
  -iname '*.txt' -o \
  -iname 'info.json' -o \
  -iname 'thumbnail.png'); do
  cp --parents $F $OUTPUT_DIR;
done

for F in $(find . \
  -iname '*.lua' -type f -not -path \"./.*/*\"); do
  cp --parents $F $OUTPUT_DIR;
done

for F in $(find ./graphics \
  -iname '*.png' -type f); do
  cp --parents $F $OUTPUT_DIR;
done

ORIGIN=$(pwd)
cd $BUILD_DIR

echo "Creating release file: $PACKAGE_FILE"
zip -rq $PACKAGE_FILE $PACKAGE_FULL_NAME

cd $ORIGIN
mkdir dist/

cp $BUILD_DIR/$PACKAGE_FILE dist

echo "$PACKAGE_FILE ready at dist/$PACKAGE_FILE"
echo "::set-output name=asset_path::${INPUT_MOD_BASE_DIR}/dist/${PACKAGE_FILE}"
