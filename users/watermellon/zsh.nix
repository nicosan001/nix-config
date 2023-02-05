{ libs, config, pkgs, ... }:
{
programs.zsh = {
  enable = true;
  shellAliases = {
    l = "exa -lah --icons";
    ls = "exa -lah --icons";
  };

  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };

  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "robbyrussell";
  };

};
  
}
