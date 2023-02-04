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
}
