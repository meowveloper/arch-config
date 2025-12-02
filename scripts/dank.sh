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

ln -s "${SOURCE_DIR}/chezmoi/dank" "${CHEZMOI_DIR}"

echo -e "${GREEN}Applying chezmoi dotfiles${NC}"
chezmoi apply

pkill waybar
dms greeter enable
sudo systemctl enable greetd
dms greeter sync
bash "${HOME}/.config/hypr/start-up.sh"

echo "run the following two cmds"
echo "dms greeter enable"
echo "dms greeter sync"

