#!/bin/bash


echo "running flatpak post install hook"
systemctl --user enable --now xdg-desktop-portal-gnome
flatpak uninstall --unused
echo "flatpak post install hook done"

