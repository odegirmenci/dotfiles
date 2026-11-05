# Version 0.2.0
# ---------- BASICS ----------
export ZDOTDIR=$HOME
export EDITOR=nvim
export VISUAL=nvim
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# ---------- COMPLETION ----------
autoload -Uz compinit
compinit

# ---------- COMPLETION ----------
fpath=(/usr/share/zsh/site-functions $fpath)

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'



# ---------- PROMPT ----------
autoload -Uz colors && colors
PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %(?.%F{green}❯.%F{red}❯)%f '

# ---------- KEYBINDINGS ----------
bindkey -e
bindkey '^R' fzf-history-widget

# ---------- ALIASES ----------
# ---------- ALIASES ----------
alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias gs='git status'
alias gl='git log --oneline --graph --decorate'
alias v='nvim'
alias c='clear'

# ---------- FZF ----------
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
[ -f /usr/share/fzf/shell/completion.zsh ] && source /usr/share/fzf/shell/completion.zsh

# ---------- TMUX AUTO ----------
if command -v tmux >/dev/null 2>&1 \
   && [ -z "$TMUX" ] \
   && [[ $- == *i* ]] \
   && [ -z "$SSH_CONNECTION" ]; then
  exec tmux new-session -A -s main
fi

# bun completions
#[ -s "/home/osman/.bun/_bun" ] && source "/home/osman/.bun/_bun"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#565f89'
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="/home/osman/.bun/bin:$PATH"
#export PATH="$BUN_INSTALL/bin:$PATH"

# Rust

export PATH="$HOME/.cargo/bin:$PATH"

# opencode
export PATH=/home/osman/.opencode/bin:$PATH

# >>> Codex installer >>>
export PATH="/home/osman/.local/bin:$PATH"
# <<< Codex installer <<<

# Vite+ bin (https://viteplus.dev)
. "/home/osman/.config/vite-plus/env"
