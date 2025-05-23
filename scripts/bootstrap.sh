#!/bin/bash

set -e

# Install Zsh if missing
if ! command -v zsh >/dev/null 2>&1; then
  echo "Installing Zsh..."
  sudo apt update && sudo apt install -y zsh
  
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
	  echo "Installing Oh My Zsh..."
	  export RUNZSH=no
	  export CHSH=no
	  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	  
	  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	  git clone https://github.com/changyuheng/zsh-interactive-cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-interactive-cd
	fi
fi

# Install nala
if ! command -v nala >/dev/null 2>&1; then
  echo "Installing Nala..."
  echo "deb [trusted=yes] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar.list
  wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar.asc
  sudo apt update
  sudo apt install -y nala
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

# Cleanup
sudo nala autoremove -y
sudo nala clean

# Finish
echo "Bootstrap script completed successfully."

