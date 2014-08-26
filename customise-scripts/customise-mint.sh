##1 - Add ubuntu-resttricted app

sudo apt-get install ubuntu-restricted-extras
sudo apt-get install ubuntu-restricted-addons

##2 - Trust Intel GPG Keys

wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | \
sudo apt-key add -

wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-2 -O - | \
sudo apt-key add -

##3 - Set Up the GIT Environment

sudo apt-get install git -y

git config --global user.name "Brett Harrison"
git config --global user.email "yogibrett@gmail.com"
cd ~
git clone git@github.com:prohep/stash.git
