{ config, pkgs, ... }:
{
  # change shell to zsh
  programs.zsh.enable = true;

 programs.zsh = {
   shellAliases = {
     l = "exa -lah --icons";
     ls = "exa -lah --icons";
   };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}
