#!/bin/bash

BUILD_DIR="/tmp/dcli-install-build"
DCLI_DIR="${HOME}/.config/arch-config"

rm -rf "${BUILD_DIR}"

git clone https://gitlab.com/theblackdon/dcli.git "${BUILD_DIR}"

bash "${BUILD_DIR}/install.sh"

mkdir -p "${HOME}/.config"

git clone https://github.com/meowveloper/arch-config.git "${DCLI_DIR}"

dcli sync

