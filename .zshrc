if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export GOPATH="$HOME/.local/go"
export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:/usr/local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

plugins=(git zsh-autosuggestions zsh-syntax-highlighting golang brew colorize eza fzf kitty python rsync systemd tmux ufw uv zoxide)

source $ZSH/oh-my-zsh.sh

alias pac="paru"
alias vim="nvim"
alias vi="nvim"
alias ls="eza"
alias grep="rg"
alias cat="bat -P"
alias find="fd"

function y() {
  local tmp cwd
  tmp="$(mktemp -t yazi-cwd.XXXXXX)" || return
  command yazi "$@" --cwd-file="$tmp"
  cwd="$(<"$tmp")"
  [[ -n "$cwd" && "$cwd" != "$PWD" && -d "$cwd" ]] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"

