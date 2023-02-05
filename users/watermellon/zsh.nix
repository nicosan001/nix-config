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
   initExtra = ''
   [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
   '';
    plugins = with pkgs; [
    {
      file = "powerlevel10k.zsh-theme";
      name = "powerlevel10k";
      src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
    }
    {
      name = "powerlevel10k-config";
      src = lib.cleanSource ./p10k-config;
      file = "p10k.zsh";
    }
  ];
  };
}
