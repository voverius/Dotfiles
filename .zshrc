# --- PATH ---
export PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  sudo
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-interactive-cd
)
source "$ZSH/oh-my-zsh.sh"

# --- Scripts ---
alias cleanup='bash ~/Dotfiles/scripts/system-cleanup.sh'
alias update='bash ~/Dotfiles/scripts/system-update.sh'
alias shake='sudo systemctl restart logid'

# --- History ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory sharehistory histignorespace

# --- Options ---
setopt autocd nocaseglob correct extendedglob prompt_subst

# --- Python ---
export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv >/dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# --- Aliases ---
alias ls='ls --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Navigate faster
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

