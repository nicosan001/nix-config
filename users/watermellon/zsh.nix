{ libs, config, pkgs, ... }:
{

  home.packages = with pkgs; [
    meslo-lgs-nf
    zsh-powerlevel10k
  ];

  # change shell to zsh
  programs.zsh.enable = true;

 programs.zsh = {

   enableAutosuggestions = true;
   

   shellAliases = {
     l = "exa -lah --icons";
     ls = "exa -lah --icons";
   };

   plugins = with pkgs; [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
  ];
   
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

# programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

}
