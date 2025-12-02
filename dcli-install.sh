#!/bin/bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Installing dcli${NC}"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

BUILD_DIR="/tmp/dcli-install-build"
rm -rf "${BUILD_DIR}"

git clone https://gitlab.com/theblackdon/dcli.git "${BUILD_DIR}"
bash "${BUILD_DIR}/install.sh"

rm -rf "${BUILD_DIR}"

echo -e "${GREEN}dcli installation complete${NC}"
