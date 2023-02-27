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
if test -e ~/.env
  source ~/.env
end

# Starship
if command -v starship > /dev/null
  starship init fish | source
end

# Zoxide
zoxide init fish | source

# Git
set -x PATH $PATH /usr/local/share/git-core/contrib/diff-highlight

# krew (a plugin manager for kubectl)
set -gx PATH $PATH $HOME/.krew/bin

# Rust
set -x PATH $PATH $HOME/.cargo/bin

# Node
eval (nodenv init - | source)
set -x PATH $PATH /Users/masaharu/.npm_global/bin

# Python
pyenv init - | source

# others
alias g='git'
if command -v bat > /dev/null
  alias cat='bat'
end
if command -v rmtrash > /dev/null
  alias rm='rmtrash'
end
alias fig='docker-compose'
alias k='kubectl'
alias python='python3'

# Created by `pipx` on 2023-02-07 09:35:36
set PATH $PATH /Users/masaharu/.local/bin
