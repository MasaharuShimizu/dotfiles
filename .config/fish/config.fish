# Delete messages when fish-shell starts
set -u fish_greeting

# Use exa instead of ls
if command -v exa > /dev/null
  alias e='exa --icons'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons'
  alias la=ea
  alias ee='exa -aal --icons'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
end

# ssh-agent
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
set -x SSH_PATH /Users/masaharu/.ssh

# Common PATH
set -x PATH $PATH /usr/local/sbin
source ~/.env

# Starship
starship init fish | source


# Git
set -x PATH $PATH /usr/local/share/git-core/contrib/diff-highlight

# krew (a plugin manager for kubectl)
set -gx PATH $PATH $HOME/.krew/bin

# others
alias g='git'
alias rm='rmtrash'
alias fig='docker-compose'
alias k='kubectl'
