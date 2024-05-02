@echo off

:: Install
%PYTHON% -m pip install qcs-sdk-python ^
  --no-build-isolation ^
  --no-deps ^
  --no-indes ^
  --only-binary :all: ^
  --find-links=wheels ^
  --prefix %PREFIX%
