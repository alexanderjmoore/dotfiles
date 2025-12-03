# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Aliases
alias pac="paru"
alias nv="nvim"
alias vim="nvim"
alias vi="nvim"
alias ls="eza -lh"
alias grep="rg"
alias cat="bat"
alias find="fd"

# Environment Variables
set -gx GOPATH $HOME/.local/share/go
set -gx GOBIN $HOME/.local/bin

# PATH
fish_add_path -g $GOBIN

# Functions
function jellyfinmediaplayer
    env QT_QPA_PLATFORM=xcb jellyfinmediaplayer $argv
end

function torbrowser-launcher
    env QT_QPA_PLATFORM=xcb torbrowser-launcher $argv
end
