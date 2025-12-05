#!/bin/bash

echo "running flatpak post install hook"
flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak uninstall --unused
echo "flatpak post install hook done"
