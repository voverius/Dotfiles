#!/bin/bash
set -e

echo "Updating system..."

sudo nala update && sudo nala upgrade -y
flatpak update -y 2>/dev/null || true

echo "System update completed."

