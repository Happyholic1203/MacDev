#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

brew install ack apktool arping atk autoconf automake bash-completion \
    binutils bison27 brew-cask cairo cloog-ppl015 cmake cscope curl \
    d-bus dex2jar doxygen faac ffmpeg fftw flex fontconfig freetype fswatch \
    gd gdb gdbm gdk-pixbuf geoip gettext ghostscript git glib gmp gmp4 \
    gnuplot gnutls gobject-introspection graphviz gtk+ harfbuzz \
    hicolor-icon-theme htop-osx icu4c irssi jbig2dec jpeg lame libcroco \
    libevent libffi libgcrypt libgpg-error libksba libmagic libmpc08 libnet \
    libpng librsvg libtasn1 libtiff libtool libyaml little-cms2 lua \
    macvim mcrypt mhash minicom mongodb mpfr2 nettle nginx node openssl \
    ossp-uuid osxfuse pandoc pango pcre php54-xdebug php56 pixman pkg-config \
    postgresql ppl011 python qt re2c readline reattach-to-user-namespace \
    rlwrap scons socat sphinx sqlite sqlmap ssdeep sshfs texi2html tmux \
    tor tree unar unixodbc valgrind wget wireshark wxmac wxpython x264 xvid \
    xz yasm zlib

# optional
# text-based web browser
brew install lynx

# install-cask
my_cask=359ff0c4f32efe03a57d
cd /tmp && git clone https://gist.github.com/${my_cask}.git
cd $my_cask && bash cask-install.sh

# install dotfiles
cd ~ && git clone https://github.com/Happyholic1203/dotfiles.git
cd dotfiles && bash install.sh -n

# update environment variables
source ~/.bashrc

pip install -r requirements.txt
