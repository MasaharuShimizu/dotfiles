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

# terminal colors
alias ls='gls -F --color=auto'
alias la='gls -aF --color=auto'
alias ll='gls -lF --color=auto'
alias grep='grep --color=auto'
set -x LS_COLORS (cat ~/dotfiles/.config/fish/dircolors.solarized-ansi-dark-fish)

# ssh-agent
ssh-add ~/.ssh/id_rsa_juno
ssh-add ~/.ssh/id_rsa_zero2
ssh-add ~/.ssh/id_rsa_gitlab

# environmental varaiables
set GOROOT $GOROOT /usr/local/opt/go/libexec
set GOPATH $GOPATH $HOME
set PATH $PATH ~/bin ~/bin/dotfiles/bin ~/.cabal/bin/ $HOME/.nodebrew/current/bin $GOROOT/bin $GOPATH/bin

# others
alias rm='rmtrash'

# Redefine fish_prompt
function fish_prompt
~/powerline-shell.py $status --shell bare ^/dev/null
end
