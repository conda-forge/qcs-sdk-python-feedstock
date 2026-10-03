@echo off

git config --system core.longpaths true

maturin build --release --manifest-path %SRC_DIR%\crates\lib\Cargo.toml --out %SRC_DIR%\wheels

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
