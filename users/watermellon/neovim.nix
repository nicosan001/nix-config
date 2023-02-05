{ config, lib, pkgs, ... }:
{
  home.file = {
    ".config/nvim/init.vim".text = ''
      set clipboard=unnamedplus
      set completeopt=noinsert,menuone,noselect
      "set cursorline
      set hidden
      set inccommand=split
      set mouse=a
      set number
      set relativenumber
      set splitbelow splitright
      set title
      set ttimeoutlen=0
      set wildmenu

      " Tabs size
      set expandtab
      set shiftwidth=2
      set tabstop=2

      " syntax and other
      filetype plugin indent on
      syntax on
      set t_Co=256
    '';
  };
}
