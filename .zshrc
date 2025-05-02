# --- PATH ---
export PATH="$HOME/.pyenv/bin:$HOME/.scripts:$HOME/.local/bin:$PATH"

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
alias system-cleanup='bash ~/.scripts/system-cleanup.sh'
alias update-system='bash ~/.scripts/update-system.sh'
alias shake='sudo systemctl restart logid'

# --- Aliases ---
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# --- History ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory sharehistory histignorespace

# --- Options ---
setopt autocd nocaseglob correct extendedglob prompt_subst

# --- Python ---
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

