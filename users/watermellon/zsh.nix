{ libs, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    meslo-lgs-nf
  ];
  # change shell to zsh
  programs.zsh.enable = true;

 programs.zsh = {
   shellAliases = {
     l = "exa -lah --icons";
     ls = "exa -lah --icons";
   };
    plugins = with pkgs; [
    {
      file = "powerlevel10k.zsh-theme";
      name = "powerlevel10k";
      src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
    }
    {
      file = "p10k.zsh";
      name = "powerlevel10k-config";
      src = ../../config/zsh/p10k;
    }
  ];
  };
}
