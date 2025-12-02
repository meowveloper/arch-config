#!/bin/bash

set -euo pipefail


DCLI_DIR="${HOME}/.config/arch-config"

bash "${DCLI_DIR}/yay-install.sh"
bash "${DCLI_DIR}/dcli-install.sh"

dcli sync

echo -e "${GREEN}Updating font cache${NC}"
fc-cache -f -v

echo -e "${GREEN}Enabling system-wide services${NC}"
sudo systemctl enable --now warp-svc.service

bash "${DCLI_DIR}/scripts/archlinux.sh"
echo -e "${GREEN}All done! You can reboot now!!${NC}"


