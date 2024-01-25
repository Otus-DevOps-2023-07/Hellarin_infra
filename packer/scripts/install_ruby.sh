#!/bin/bash
#Script for installation ruby

#install ruby
sudo apt update
pkill -9 apt
apt install -y ruby-full ruby-bundler build-essential
