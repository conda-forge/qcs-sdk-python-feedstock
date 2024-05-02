#!/bin/bash

set -ex

# Build
maturin build --release --manifest-path ${SRC_DIR}/crates/python/Cargo.toml --out ${SRC_DIR}/wheels

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
