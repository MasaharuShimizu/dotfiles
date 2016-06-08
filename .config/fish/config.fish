# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme gitstatus

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme extract

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Delete messages when fish-shell starts
set -u fish_greeting

# terminal colors
alias ls='gls -F --color=auto'
alias la='gls -aF --color=auto'
alias ll='gls -lF --color=auto'
alias grep='grep --color=auto'

# ssh-agent
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa_zero2 > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa_gitlab > /dev/null 2>&1

# editor
set -x EDITOR vim

# Common PATH
set -x PATH $PATH $HOME/bin

# Redefine fish_prompt
function fish_prompt
  ~/powerline-shell.py $status --shell bare ^/dev/null
end

# node.js
set -x PATH $PATH $HOME/.nodebrew/current/bin

# rbenv
set -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash > /dev/null ^&1

# python
source $HOME/.pythonz/etc/pythonz.fish
eval (direnv hook fish)
eval (python -m virtualfish auto_activation)

# Java
set -x JAVA_HOME $JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home

# Go
set -x GOPATH $GOPATH /Users/shimizu/go
set -x PATH $PATH $GOPATH/bin

# others
alias rm='rmtrash'
alias tunnel='ssh -N -f tunnel'
alias quitunnel='ps -A|grep ssh|grep tunnel|sed -e \'s/\([0-9]*\).*/kill \1/g\'|sh'
