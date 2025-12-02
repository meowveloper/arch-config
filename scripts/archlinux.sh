#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


echo -e "${GREEN}Creating symlink of the chezmoi directory${NC}"
echo -e "${GREEN}Cloning and applying dotfiles${NC}"
mkdir -p "${HOME}/.local/share"
CHEZMOI_DIR="${HOME}/.local/share/chezmoi"
SOURCE_DIR="${HOME}/.config/arch-config"

rm -rf "$CHEZMOI_DIR"

ln -s "${SOURCE_DIR}/chezmoi/archlinux" "${CHEZMOI_DIR}"

echo -e "${GREEN}Applying chezmoi dotfiles${NC}"

bash "${HOME}/.config/hypr/start-up.sh"
