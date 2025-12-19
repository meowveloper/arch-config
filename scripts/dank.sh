#!/usr/bin/env bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")


echo -e "${GREEN}Running Dank post install hook${NC}"

mkdir -p "${ACTUAL_HOME}/.local/share"
CHEZMOI_DIR="${ACTUAL_HOME}/.local/share/chezmoi"
SOURCE_DIR="${ACTUAL_HOME}/.config/arch-config"

echo -e "${GREEN}Creating symlink of the chezmoi directory${NC}"

rm -rf "$CHEZMOI_DIR"

ln -s "${SOURCE_DIR}/chezmoi/dank" "${CHEZMOI_DIR}"

echo -e "${GREEN}Applying chezmoi dotfiles${NC}"
chezmoi apply

pkill waybar
dms greeter enable
sudo systemctl enable greetd
dms greeter sync
bash "${ACTUAL_HOME}/.config/hypr/start-up.sh"

echo -e "${GREEN}Dank post install hook complete!${NC}"
echo "run the following two cmds"
echo "dms greeter enable"
echo "dms greeter sync"

