# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Aliases
alias pac="paru"
alias nv="nvim"
alias ls="eza -lha"

# Environment Variables
set -gx GOPATH $HOME/.local/share/go
set -gx GOBIN $HOME/.local/bin

# PATH
fish_add_path -g $GOBIN
