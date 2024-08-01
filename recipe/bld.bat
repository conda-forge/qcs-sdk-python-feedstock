@echo off

:: Build quil-rs locally to circumvent the path limitation on windows
set TMP_DIR=%TEMP%\mytempdir
mkdir %TMP_DIR%
cd %TMP_DIR%
git clone https://github.com/rigetti/quil-rs.git
cd quil-rs
git checkout tags/quil-py/v0.11.1
xcopy /s /e /y %TMP_DIR%\quil-rs %SRC_DIR%\crates\quil-rs

maturin build --release --manifest-path %SRC_DIR%\crates\python\Cargo.toml --out %SRC_DIR%\wheels

# Re-build with patch package metadata for grpc-web
%PYTHON% %SRC_DIR%\crates\python\scripts\patch_grpc_web.py
cargo update hyper-proxy
maturin build --release --manifest-path %SRC_DIR%\crates\python\Cargo.toml --out %SRC_DIR%\wheels

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
