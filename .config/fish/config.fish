# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme gitstatus

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme extract

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

# Common PATH
set -x PATH $PATH $HOME/bin /usr/local/sbin

# Starship
eval (starship init fish)

# Git
set -x PATH $PATH /usr/local/share/git-core/contrib/diff-highlight

# others
alias rm='rmtrash'
