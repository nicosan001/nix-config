{ config, pkgs, ... }:
{
  # change shell to zsh
  programs.zsh.enable = true;

 programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
  ShellAliases = {
    ls = "exa -lah --icons";
    l = "exa -lah --icons";
  };
}
