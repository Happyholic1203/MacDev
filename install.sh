#!/bin/bash

if ! which brew; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# essentials
brew install binutils curl doxygen gdb graphviz irssi openssl pandoc \
    reattach-to-user-namespace tmux socat sphinx sqlite sqlmap tor tree wget \
    xz z3 gpg python readline

wget -qO- https://bootstrap.pypa.io/get-pip.py > /tmp/get-pip.py
python /tmp/get-pip.py --user

pip install ipython pwntools

# TODO: ipython
# TODO: python libraries
echo "Enabling readline in IPython interactive shell"
ipython profile create
sed -i.bak "s/^#c\.TerminalInteractiveShell\.editing_mode/c.TerminalInteractiveShell.editing_mode = 'vi'/g" ~/.ipython/profile_default/ipython_config.py
rm -f ~/.ipython/profile_default/ipython_config.py.bak

# install Xcode

# install watermark pro

# install chrome, firefox, mantra, burpsuite
# hopper
# install radare2

# brew cask install macdown wireshark

# after installing Xcode
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

brew install ack apktool arping atk autoconf automake bash-completion \
    binutils bison27 brew-cask cairo cloog-ppl015 cmake cscope curl \
    d-bus dex2jar doxygen faac ffmpeg fftw flex fontconfig freetype fswatch \
    gd gdb gdbm gdk-pixbuf geoip gettext ghostscript git glib gmp gmp4 \
    gnuplot gnutls gobject-introspection graphviz gtk+ harfbuzz \
    hicolor-icon-theme htop-osx icu4c irssi jbig2dec jpeg lame libcroco \
    libevent libffi libgcrypt libgpg-error libksba libmagic libmpc08 libnet \
    libpng librsvg libtasn1 libtiff libtool libyaml little-cms2 lua \
    mcrypt mhash minicom mongodb mpfr2 nettle nginx node openssl \
    ossp-uuid osxfuse pandoc pango pcre php54-xdebug php56 pixman pkg-config \
    postgresql ppl011 qt re2c readline reattach-to-user-namespace \
    rlwrap scons socat sphinx sqlite sqlmap ssdeep sshfs texi2html tmux \
    tor tree unar unixodbc valgrind wget wireshark wxmac wxpython x264 xvid \
    xz yasm zlib z3 fakeroot the_silver_searcher

brew install python
brew install vim --override-system-vi
brew install macvim --with-override-system-vim

# optional
# text-based web browser
brew install lynx

# install-cask
my_cask=359ff0c4f32efe03a57d
cd /tmp && git clone https://gist.github.com/${my_cask}.git
cd $my_cask && bash cask-install.sh

brew install chromedriver # for selenium

# install dotfiles
cd ~ && git clone https://github.com/Happyholic1203/dotfiles.git
cd dotfiles && bash install.sh -n

# update environment variables
source ~/.bashrc

pip install -r requirements.txt

# reversing tools
cd /tmp
wget http://stevenygard.com/download/class-dump-3.5.tar.gz
tar -zxvf class-dump-3.5.tar.gz
cd class-dump-3.5 && mv class-dump /usr/local/bin
cd .. && rm -rf class-dump-3.5 && rm -f class-dump-3.5.tar.gz

# cross compiler (test with `gcc-4.9 --version`)
# XXX: not done yet
brew tap homebrew/versions
brew install --enable-cxx gcc49

npm install jsduck

# install alfred2 workflows for developers: https://github.com/willfarrell/alfred-workflows

echo "Starting up locate db, I need your root password here"
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
# install tunnelblick
