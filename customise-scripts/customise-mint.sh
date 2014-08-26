## - Add additional packages

sudo apt-get install ubuntu-restricted-extras -y
sudo apt-get install ubuntu-restricted-addons -y
sudo apt-get install vim mc htop sysstat -y


## - Trust Intel GPG Keys

wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | \
sudo apt-key add -

wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-2 -O - | \
sudo apt-key add -

## - Set Up the GIT Environment

sudo apt-get install git -y

git config --global user.name "Brett Harrison"
git config --global user.email "yogibrett@gmail.com"
git config --global push.default matching

git clone git@github.com:prohep/stash.git

## - Set Up Login Profile

cat > ~/.bash_profile <<EOF
#!/bin/sh

### THIS IS A DUMMY FILE
### DON'T NEED TWO FILES TO DO ONE JOB
### LET'S CALL ~/.bashrc INSTEAD

source ~/.bashrc
EOF

sudo echo -e \#\!\/bin\/sh > /tmp/bashrc
sudo echo -e "source ~/.bashrc" >> /tmp/bashrc
sudo mv /tmp/bashrc /etc/profile.d/bashrc
sudo chmod +x /etc/profile.d/bashrc.sh
sudo chmod +x /etc/profile.d/bash_completion.sh

cat > ~/.bashrc <<EOF
#!/bin/sh

### ALIASES

alias ls="ls --color"
alias ll="ls --color -lh"
alias la="ls --color -a"
alias vim="vim -y"
alias nano="nano -w -i"
alias sai="sudo apt-get install"
alias sad="sudo apt-get remove"
alias sap="sudo apt-get remove --purge"
alias sas="sudo apt-cache search"
alias cp="cp -i"


### Command Prompt

# My prompt, quite basic, decent coloring, shows the value of $?
# (exit value of last command, useful sometimes):
C_DEFAULT="[33[0m]"
C_BLUE="[33[0;34m]"
export PS1="$C_BLUE($C_DEFAULT$?$C_BLUE)[$C_DEFAULTu$C_BLUE@$C_DEFAULTh$C_BLUE:$C_DEFAULTw$C_BLUE]\$ $C_DEFAULT"
export PS2="$C_BLUE> $C_DEFAULT"

### New Mail Function

function newmail()
{
    tot=0
    for mb in $MAIL/*; do
        cnt=`ls -1 $mb/new/|wc -l`
        tot=`expr $tot + $cnt`
        echo "$(basename $mb):$cnt"
    done
    echo "Total:$tot"
}

### Miscellaneous functions

:h() {  vim --cmd ":silent help $@" --cmd "only"; }
:q() { exit }

### Let grep colorize the search results
alias g="egrep --color=always"
alias gi="egrep -i --color=always"

### Don't save repeated commands in bash history
export HISTCONTROL="ignoredups"

### nh - run command detached from terminal and without output
### Usage: nh <command>

nh() {
    nohup "$@" &>/dev/null &
}

### Disable ^S/^Q flow control (does anyone like/use this at all?)
stty -ixon

EOF

chown $USERNAME ~/.bashrc
