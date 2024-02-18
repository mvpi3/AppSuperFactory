#!/bin/sh

echo 'brew install pod'
 
brew install cocoapods

echo 'pod install' 

pod install --no-repo-update
