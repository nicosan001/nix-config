{ libs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "watermellon";
  home.homeDirectory = "/home/watermellon";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  imports = [
    ./software.nix
    ./neovim.nix
    ./alacritty.nix
    ./zsh.nix
    ./sway.nix
    ./sway-scripts.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.gpg = {
    enable = true;
  };

  # buttons on bluetooth headset working

  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.After = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  home.packages = with pkgs; [
    alacritty
    neovim
    htop
    emacs
    emacsPackages.doom
    hexchat
    neofetch
    blueman
    git
    git-crypt
    gnupg
    pinentry_qt
    xclip
    zplug
    zsh-powerlevel10k
    libreoffice
    wl-clipboard
    ];
}
