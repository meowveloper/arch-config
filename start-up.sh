#!/bin/bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Running dcli sync${NC}"
dcli sync

echo -e "${GREEN}Setting up flatpak${NC}"
flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "${GREEN}Updating font cache${NC}"
fc-cache -f -v

echo -e "${GREEN}Enabling system-wide services${NC}"
sudo systemctl enable --now warp-svc.service

echo -e "${GREEN}All done! You can reboot now!!${NC}"


