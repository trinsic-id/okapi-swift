#!/bin/bash

# install protoc and required plugins

#brew install protobuf swift-protobuf

# add 'trinsic-id/okapi' repository as submodule
# to use the proto files for code generation

git submodule add https://github.com/trinsic-id/okapi

# define protoc plugin paths and generate the files

PROTOC=`which protoc`
PROTOC_GEN_SWIFT=`which protoc-gen-swift`

PROTO_ROOT=./okapi/proto/
OUT_DIR=./Sources/Okapi/proto

for f in $(find $PROTO_ROOT -name "*.proto");
do
    ${PROTOC} \
    --proto_path=${PROTO_ROOT} \
    --plugin="${PROTOC_GEN_SWIFT}" \
    --swift_opt=Visibility=Public \
    --swift_out=${OUT_DIR} "$f"
done

# remove the git submodule

git submodule deinit okapi
git rm okapi
rm -rf .git/modules/okapi
