
export ZSH="$HOME/.oh-my-zsh"
local plugins=(git)
ZSH_THEME=""

plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Initialize Starship prompt
eval "$(starship init zsh)"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# Homebrew completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Zsh Completions
autoload -Uz compinit
compinit

ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Search your command history interactively
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Keybindings
bindkey '^R' history-incremental-search-backward

# Common shortcuts
alias ll='ls -lah'
alias gs='git status'
alias gl='git log --oneline --graph --decorate'
alias ga='git add .'
alias gp='git push'
alias npmdev='npm run dev -- --open'
alias python='python3'
alias ff='fastfetch'
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias docs='cd ~/Documents'
alias storage='dua i'

eval "$(zoxide init zsh)"
alias cd='z'
alias cat='bat'
alias ls='eza --icons'

zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select

alias rm='rm -i'

alias reload!='source ~/.zshrc'

# Nord Light color overrides
ZSH_HIGHLIGHT_STYLES[command]='fg=#2E3440'       # dark gray
ZSH_HIGHLIGHT_STYLES[alias]='fg=#5E81AC'         # blue
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#81A1C1'       # lighter blue
ZSH_HIGHLIGHT_STYLES[function]='fg=#88C0D0'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#4C566A'    # gray
ZSH_HIGHLIGHT_STYLES[error]='fg=#BF616A'         # red
ZSH_HIGHLIGHT_STYLES[comment]='fg=#4C566A italic'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4C566A'  # grayish Nord

# Colored man pages
man() { env LESS_TERMCAP_md=$'\e[1;36m' LESS_TERMCAP_me=$'\e[0m' LESS_TERMCAP_se=$'\e[0m' LESS_TERMCAP_so=$'\e[1;40;93m' LESS_TERMCAP_ue=$'\e[0m' LESS_TERMCAP_us=$'\e[1;32m' man "$@"; }

# Automatically correct small typos in commands
setopt correct

# Command correction
eval "$(thefuck --alias)"

# Make "cd" show the new path
chpwd() { ls; }

# bun completions
[ -s "/Users/bj/.bun/_bun" ] && source "/Users/bj/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.amp/bin:$PATH"
export PATH="$HOME/.amp/bin:$PATH"

# Added by Antigravity
export PATH="/Users/bj/.antigravity/antigravity/bin:$PATH"
