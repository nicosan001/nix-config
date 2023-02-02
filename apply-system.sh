#!/bin/sh
pushd ~/.dotfiles
cp system/hardware-configuration.nix system/hardware-configuration.nix.bak
cp /etc/nixos/hardware-configuration.nix system/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#
popd
