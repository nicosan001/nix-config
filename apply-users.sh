#!/bin/sh
pushd ~/.dotfiles
nix build .#homeManagerConfigurations.watermellon.activationPackage
./result/activate
popd
