#!/bin/bash

set -e

# Define directories
DOTFILES_DIR="$HOME/dotfiles"
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$OH_MY_ZSH_DIR/custom"

# Create dotfiles directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"

# Install Zsh if not already installed
if ! command -v zsh >/dev/null 2>&1; then
    echo "Installing Zsh..."
    sudo apt update
    sudo apt install -y zsh
fi

# Install Oh My Zsh
if [ ! -d "$OH_MY_ZSH_DIR" ]; then
    echo "Installing Oh My Zsh..."
    RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel10k theme
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# Install zsh-autosuggestions plugin
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Install zsh-syntax-highlighting plugin
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc to $DOTFILES_DIR/.zshrc.backup"
    cp "$HOME/.zshrc" "$DOTFILES_DIR/.zshrc.backup"
fi

# Create new .zshrc
echo "Creating new .zshrc..."
cat > "$HOME/.zshrc" <<EOF
export ZSH="$OH_MY_ZSH_DIR"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git sudo z zsh-autosuggestions zsh-syntax-highlighting)
source \$ZSH/oh-my-zsh.sh
EOF

# Change default shell to Zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to Zsh..."
    chsh -s "$(which zsh)"
fi

echo "Zsh environment setup complete."

