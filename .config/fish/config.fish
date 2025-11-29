# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Aliases
alias pac="paru"
alias nv="nvim"
alias vim="nvim"
alias vi="nvim"
alias ls="eza -lha"
alias grep="rg"

# Environment Variables
set -gx GOPATH $HOME/.local/share/go
set -gx GOBIN $HOME/.local/bin

# PATH
fish_add_path -g $GOBIN
