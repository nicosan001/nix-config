{ config, pkgs, ... }:
{
  home.file = {
    ".config/nvim/init.vim".text = ''
      set number relativenumber
      set nu rnu
      set clipboard^=unnamed,unnamedplus
      set smartindent
      set tabstop=2
      set expandtab
      set shiftwidth=2
      syntax on
    '';
  };
}
