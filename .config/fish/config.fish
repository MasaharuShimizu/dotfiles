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
set -x LS_COLORS (cat ~/dotfiles/.config/fish/dircolors.solarized-ansi-dark-fish)

# brew
alias bs='brew -S'
alias bi='brew info'
alias bl='brew list'
alias bup='brew update'
alias bupg='brew upgrade --all'

# ssh-agent
ssh-add ~/.ssh/id_rsa_juno
ssh-add ~/.ssh/id_rsa_zero2
ssh-add ~/.ssh/id_rsa_gitlab

# environmental varaiables
set -x JAVA_HOME $JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
set -x GOPATH $GOPATH /Users/shimizu/gocode
set PATH $PATH $HOME/bin $HOME/bin/dotfiles/bin $HOME/.cabal/bin $HOME/.nodebrew/current/bin $GOROOT/bin $GOPATH/bin

# others
alias rm='rmtrash'
alias tunnel='ssh -N -f tunnel'
alias quitunnel='ps -A|grep ssh|grep tunnel|sed -e \'s/\([0-9]*\).*/kill \1/g\'|sh'

# Redefine fish_prompt
function fish_prompt
~/powerline-shell.py $status --shell bare ^/dev/null
end

# Change fish key bindings like vim
function fish_user_key_bindings
  fish_vi_key_bindings
end
