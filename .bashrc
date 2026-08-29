# ~/.bashrc

# History
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups
HISTIGNORE="ls:ll:pwd:clear:history:exit"
shopt -s histappend checkwinsize globstar
PROMPT_COMMAND='history -a; history -n'

# Completion
if [[ -r /etc/profile.d/bash_completion.sh ]]; then
  . /etc/profile.d/bash_completion.sh
elif [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

# Readline behavior
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set menu-complete-display-prefix on'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Colors
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias diff='diff --color=auto'
fi

# Prompt
if [[ ${EUID} -eq 0 ]]; then
  PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
else
  PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\W\[\e[0m\]\$ '
fi

# Aliases
alias ll='ls -lahF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias v='vim'

# Functions
mkcd() {
  mkdir -p -- "$1" && cd -- "$1"
}

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/alex/.lmstudio/bin"
# End of LM Studio CLI section

