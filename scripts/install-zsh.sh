#!/bin/bash

set -e

# Install Zsh if missing
if ! command -v zsh >/dev/null 2>&1; then
  echo "Installing Zsh..."
  if [ -f /etc/debian_version ]; then
    sudo apt update && sudo apt install -y zsh
  elif [ -f /etc/alpine-release ]; then
    sudo apk add zsh
  elif [ -f /etc/arch-release ]; then
    sudo pacman -S --noconfirm zsh
  else
    echo "Unsupported distro. Install Zsh manually."
    exit 1
  fi
fi

# Install Oh My Zsh if missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  export RUNZSH=no
  export CHSH=no
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Prompt to change default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  read -p "Set Zsh as default shell? [y/N]: " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    chsh -s "$(which zsh)"
    echo "Default shell changed to Zsh."
  else
    echo "Skipping shell change."
  fi
fi

echo "Zsh and Oh-My-Zsh installed."

