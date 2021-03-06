#!/bin/bash
apt-get update -q
apt-get install -y git curl

# Install xvfb (headless browser tests)

apt-get install -y xvfb
cp /root/xvfb /etc/init.d/
chmod +x /etc/init.d/xvfb
chmod +s /etc/init.d/xvfb

# PSQL client to connect and create databases in scripts
apt-get install -y postgresql-client

# Installing SBT for scala builds
#export SBT_VERSION=0.13.7
#curl -LSs https://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-${SBT_VERSION}.tgz -o /tmp/sbt.tgz
#mkdir /usr/local/sbt
#tar zxf /tmp/sbt.tgz -C /usr/local/
#ln -s /usr/local/sbt/bin/sbt /usr/local/bin


# Installing NodeJS
curl -sL https://deb.nodesource.com/setup_4.x | bash -
apt-get install -y nodejs
apt-get install -y build-essential

## Install some npm packages
npm install -g gulp
npm install -g bower
npm install -g jspm
npm install -g typings
# Installing Google Dart
#add-apt-repository -y ppa:hachre/dart
#apt-get update -q
#apt-get install -y dartsdk dartium

# Phantom JS
apt-get install -y chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev
export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
curl -LSs https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 -o /tmp/${PHANTOM_JS}.tar.bz2
mv /tmp/${PHANTOM_JS}.tar.bz2 /usr/local/share/
cd /usr/local/share/
tar xvjf ${PHANTOM_JS}.tar.bz2
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/share/phantomjs
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin/phantomjs
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/bin/phantomjs
rm ${PHANTOM_JS}.tar.bz2

# Install Chrome.
apt-get install wget -y
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
apt-get update && \
apt-get install -y google-chrome-stable && \

# Install Python and PIP
apt-get install python python-pip python-dev -y
pip install --upgrade pip
pip install --upgrade virtualenv

# Mkdocs
pip install mkdocs
pip install mkdocs-material

# NetCat

apt-get install -y netcat

# Clean Image
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/*
