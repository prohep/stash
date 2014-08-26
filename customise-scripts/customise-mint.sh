## - Add additional packages

sudo apt-get install ubuntu-restricted-extras -y
sudo apt-get install ubuntu-restricted-addons -y
sudo apt-get install vim mc htop sysstat -y

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
sudo chmod +x /etc/profile.d/bashrc
sudo chmod +x /etc/profile.d/bash_completion.sh

cat > ~/.bashrc <<EOF
#!/bin/sh

### ALIASES

alias ls="ls --color"
alias ll="ls --color -laht"
alias la="ls --color -a"
alias vim="vim -y"
alias nano="nano -w -i"
alias sai="sudo apt-get install"
alias sad="sudo apt-get remove"
alias sap="sudo apt-get remove --purge"
alias sas="sudo apt-cache search"
alias cp="cp -i"
alias g="egrep --color=always"
alias gi="egrep -i --color=always"

### Miscellaneous functions

#:h() {  vim --cmd ":silent help $@" --cmd "only"; }
:q() { exit }

### Don't save repeated commands in bash history
export HISTCONTROL="ignoredups"

### Disable ^S/^Q flow control (does anyone like/use this at all?)
stty -ixon
EOF

chown $USERNAME ~/.bashrc
