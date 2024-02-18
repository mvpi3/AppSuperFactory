#!/bin/sh
 
cd ..
 
echo ">>> SETUP ENVIRONMENT"
echo 'export GEM_HOME=$HOME/gems' >>~/.bash_profile
echo 'export PATH=$HOME/gems/bin:$PATH' >>~/.bash_profile
export GEM_HOME=$HOME/gems
export PATH="$GEM_HOME/bin:$PATH"


echo ">>> BREW UPDATE RUBY"
brew update
brew install ruby
 
echo ">>> INSTALL DEPENDENCIES"
gem install cocoapods --install-dir $GEM_HOME
 
echo ">>> INSTALL PODS"
pod install

