if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export ARCHFLAGS="-arch $(uname -m)"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      
zstyle ':omz:update' frequency 14

plugins=(git zsh-autosuggestions zsh-syntax-highlighting golang brew colorize eza fzf kitty python rsync systemd tmux ufw uv z zoxide)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
fi

alias pac="paru"
alias vim="nvim"
alias vi="nvim"
alias ls="eza"
alias grep="rg"
alias cat="bat -P"
alias find="fd"
alias y="yazi"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
