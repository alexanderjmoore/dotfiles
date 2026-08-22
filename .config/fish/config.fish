# Aliases
alias pac="paru"
alias vim="nvim"
alias vi="nvim"
alias ls="eza -lh"
alias grep="rg"
alias cat="bat"
alias find="fd"

# Environment Variables
set -gx GOPATH $HOME/.local/share/go
set -gx GOBIN $HOME/.local/bin
set -gx EDITOR nvim
set -gx VISUAL nvim

# PATH
fish_add_path -g $GOBIN

# Functions
function jellyfinmediaplayer
    env QT_QPA_PLATFORM=xcb jellyfinmediaplayer $argv
end

