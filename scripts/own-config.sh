#!/bin/bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

mkdir -p "${HOME}/.local/share"
CHEZMOI_DIR="${HOME}/.local/share/chezmoi"
SOURCE_DIR="${HOME}/.config/arch-config"

echo -e "${GREEN}Creating symlink of the chezmoi directory${NC}"

rm -rf "$CHEZMOI_DIR"

ln -s "${SOURCE_DIR}/chezmoi/own-config" "${CHEZMOI_DIR}"

echo -e "${GREEN}Applying chezmoi dotfiles${NC}"
chezmoi apply
pkill dms
bash "${HOME}/.config/hypr/start-up.sh"
