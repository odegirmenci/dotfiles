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

# ---------- PROMPT ----------
autoload -Uz colors && colors
PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %(?.%F{green}❯.%F{red}❯)%f '

# ---------- KEYBINDINGS ----------
bindkey -e
bindkey '^R' fzf-history-widget

# ---------- ALIASES ----------
alias ll='ls -alh'
alias gs='git status'
alias gl='git log --oneline --graph --decorate'
alias v='nvim'
alias c='clear'
alias nixedit='sudo nvim /etc/nixos/configuration.nix'
alias nixclean='sudo nix-collect-garbage -d'
#alias nixupdate='sudo nix-channel --update && sudo nixos-rebuild switch'

nixupdate() {
  local days="$1"
  echo "==> Kanallar güncelleniyor..." && \
  sudo nix-channel --update && \
  echo "==> Sistem yeniden derleniyor..." && \
  sudo nixos-rebuild switch && \
  if [ -n "$days" ]; then
    echo "==> Eski sürümler temizleniyor ($days)..." && \
    sudo nix-collect-garbage --delete-older-than "$days"
  else
    echo "==> Süre belirtilmediği için çöp toplama (garbage collection) atlandı."
  fi
}
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

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

# Rust

export PATH="$HOME/.cargo/bin:$PATH"

# opencode
export PATH=/home/osman/.opencode/bin:$PATH
