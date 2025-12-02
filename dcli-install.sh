#!/bin/bash

set -euo pipefail

echo -e "${GREEN}Installing dcli${NC}"

sudo pacman -S --needed go-yq --noconfirm 

BUILD_DIR="/tmp/dcli-install-build"
rm -rf "${BUILD_DIR}"

git clone https://gitlab.com/theblackdon/dcli.git "${BUILD_DIR}"
bash "${BUILD_DIR}/install.sh"

rm -rf "${BUILD_DIR}"

echo -e "${GREEN}dcli installation complete${NC}"
