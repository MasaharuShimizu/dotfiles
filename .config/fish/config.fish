# Delete messages when fish-shell starts
set -u fish_greeting

# terminal colors
alias ls='ls -GF'
alias la='ls -aGF'
alias ll='ls -lGF'
alias grep='grep --color=auto'

# ssh-agent
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
set -x SSH_PATH /Users/masaharu/.ssh

# Common PATH
set -x PATH $PATH $HOME/bin /usr/local/sbin

# Starship
eval (starship init fish)

# Git
set -x PATH $PATH /usr/local/share/git-core/contrib/diff-highlight

# others
alias rm='rmtrash'
alias fig='docker-compose'
alias k='kubectl'
