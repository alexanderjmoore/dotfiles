# Powerlevel10k instant prompt. Keep close to the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment
export LANG=en_US.UTF-8
export GOPATH="$HOME/.local/go"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=vi
  export VISUAL=vi
else
  export EDITOR=nvim
  export VISUAL=nvim
fi

export SUDO_EDITOR="$EDITOR"
export BAT_PAGER=""
export EZA_ICONS_AUTO=1

# PATH
typeset -U path PATH
path=(
  "$HOME/.local/bin"
  "$HOME/bin"
  "$GOPATH/bin"
  "$HOME/.lmstudio/bin"
  /usr/local/bin
  $path
)

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

plugins=(
  git
  zsh-autosuggestions
  golang
  eza
  fzf
  kitty
  python
  rsync
  systemd
  ufw
  uv
  zoxide
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# Aliases
alias pac="paru"
alias rm="trash"
alias c="clear"

# Pretty file viewer masquerading as cat.
function cat() {
  if (($# == 0)); then
    command cat
    return
  fi

  if [[ "$1" == -* ]]; then
    command cat "$@"
    return
  fi

  local f
  for f in "$@"; do
    if [[ -f "$f" && "$f" == *.md ]]; then
      glow "$f"
    elif [[ -f "$f" ]]; then
      bat "$f"
    else
      command cat "$f"
    fi
  done
}

# Yazi wrapper: change the shell's working directory when Yazi exits.
function y() {
  local tmp cwd

  tmp="$(mktemp -t yazi-cwd.XXXXXX)" || return
  command yazi "$@" --cwd-file="$tmp"

  cwd="$(<"$tmp")"
  [[ -n "$cwd" && "$cwd" != "$PWD" && -d "$cwd" ]] && builtin cd -- "$cwd"

  command rm -f -- "$tmp"
}

# Powerlevel10k configuration
[[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh
