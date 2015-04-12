# terminal colors
alias ls='gls -F --color=auto'
alias la='gls -aF --color=auto'
alias ll='gls -lF --color=auto'
alias grep='grep --color=auto'
eval $(gdircolors ~/color-scheme/dircolors-solarized/dircolors.ansi-dark)

# ssh-agent
ssh-add ~/.ssh/id_rsa_juno
ssh-add ~/.ssh/id_rsa_zero2
ssh-add ~/.ssh/id_rsa_gitlab

# environmental varaiables
export PATH=$PATH:/usr/texbin:~/lab/thesis/bachelor-thesis:~/bin:~/bin/dotfiles/bin

# others
alias rm='rmtrash'

function _update_ps1() {
       export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
         }

             export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
