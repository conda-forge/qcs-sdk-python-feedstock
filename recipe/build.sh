#!/bin/bash

set -ex

# Build
cd "${SRC_DIR}"/crates/lib
  export LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}"
  maturin build \
    --release \
    --strip \
    --out "${SRC_DIR}"/wheels

cd "${SRC_DIR}"
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
