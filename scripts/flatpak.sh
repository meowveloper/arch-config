#!/bin/bash


echo "running flatpak post install hook"
flatpak uninstall --unused
echo "flatpak post install hook done"

