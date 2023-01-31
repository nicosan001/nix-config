#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f users/watermellon/home.nix
popd
