{ libs, config, pkgs, ... }:
{

  home.packages = with pkgs; [
    meslo-lgs-nf
  ];

  # change shell to zsh
  programs.zsh.enable = true;

 programs.zsh = {

   enableAutosuggestions = true;

  ];
   
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}
