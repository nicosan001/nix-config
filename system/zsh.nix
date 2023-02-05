{ libs, config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    interactiveShellInit = ''
      # z - jump around
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh

      export ZSH_THEME="lambda"
      plugins=(git)
      source $ZSH/oh-my-zsh.sh
    '';
    promptInit = "";
  };
}
