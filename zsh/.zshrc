# Enable Powerlevel10k instant prompt. 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- PATH ---
export PATH="$HOME/.scripts:$HOME/.scripts/sys:$HOME/.scripts/dev:$HOME/.scripts/net:$PATH"

# --- OH MY ZSH ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    git 
    sudo 
    z 
    zsh-autosuggestions
    zsh-syntax-highlighting
    # zsh-interactive-cd
)
source $ZSH/oh-my-zsh.sh

# --- PROMPT ---
export DEFAULT_USER=$USER
setopt prompt_subst

# --- COLOR + LS ALIASES ---
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# --- SYSTEM ALIASES ---
alias update-system='bash ~/.scripts/sys/update-system.sh'
alias clear='printf "\033[H\033[J"'

# --- SAFETY ---
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# --- EDITOR ---
export EDITOR=nano

# --- TILIX INTEGRATION ---
if [[ "$TILIX_ID" ]] || [[ "$VTE_VERSION" ]]; then
  if [[ -f /etc/profile.d/vte-2.91.sh ]]; then
    source /etc/profile.d/vte-2.91.sh
  fi
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

