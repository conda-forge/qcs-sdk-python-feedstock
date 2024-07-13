#!/bin/bash

set -ex

cargo update

# Build
cd "${SRC_DIR}"/crates/python
  export LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}"
  cargo update
  maturin build \
    --release \
    --strip \
    --out "${SRC_DIR}"/wheels

  # Re-build with patch package metadata for grpc-web
  ${PYTHON} "${SRC_DIR}"/crates/python/scripts/patch_grpc_web.py
  cargo update hyper-proxy
  maturin build \
    --release \
    --strip \
    --out "${SRC_DIR}"/wheels

cd "${SRC_DIR}"
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
