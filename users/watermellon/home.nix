{ config, pkgs, ... }:

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

  # change shell to zsh
  programs.zsh.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.gpg = {
    enable = true;
  };

  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
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
    oh-my-zsh
    libreoffice
    wl-clipboard
    ];

  home.file = {
    ".config/nvim/init.vim".text = ''
      set relativenumber
      set clipboard^=unnamed,unnamedplus
      set smartindent
      set tabstop=2
      set expandtab
      set shiftwidth=2
    '';
    ".config/alacritty/alacritty.yaml".text = ''
env:
  TERM: xterm-256color
  WINIT_X11_SCALE_FACTOR: "1"

window:
  dimensions:
    columns: 80
    lines: 24

  padding:
    x: 10
    y: 10

  dynamic_padding: false

  decorations: full

  startup_mode: Windowed

  dynamic_title: true

  opacity: 0.8

scrolling:
  history: 2500
  multiplier: 3

font:
  normal:
    family: Hack
    style: Regular

  bold:
    family: Hack
    style: Bold

  italic:
    family: Hack
    style: Italic

  bold_italic:
    family: Hack
    style: Bold Italic

  size: 12

  offset:
    x: 0
    y: 0

  glyph_offset:
    x: 0
    y: 0

draw_bold_text_with_bright_colors: true

# Oxide colors
colors:
  primary:
    background: '#212121'
    foreground: '#c0c5ce'
    bright_foreground: '#f3f4f5'

  cursor:
    text: '#212121'
    cursor: '#c0c5ce'

  normal:
    black:   '#212121'
    red:     '#e57373'
    green:   '#a6bc69'
    yellow:  '#fac863'
    blue:    '#6699cc'
    magenta: '#c594c5'
    cyan:    '#5fb3b3'
    white:   '#c0c5ce'

  bright:
    black:   '#5c5c5c'
    red:     '#e57373'
    green:   '#a6bc69'
    yellow:  '#fac863'
    blue:    '#6699cc'
    magenta: '#c594c5'
    cyan:    '#5fb3b3'
    white:   '#f3f4f5'

  indexed_colors: []

bell:
  animation: EaseOutExpo
  duration: 0
  color: '#ffffff'

window.opacity: 1.0

selection:
  semantic_escape_chars: ",│`|:\"' ()[]{}<>\t"
  save_to_clipboard: false

cursor:
  style: Block
  vi_mode_style: None
  unfocused_hollow: true
  thickness: 0.15

live_config_reload: false

working_directory: None

alt_send_esc: true

mouse:
  double_click: { threshold: 300 }
  triple_click: { threshold: 300 }

  hide_when_typing: false

mouse_bindings:
  - { mouse: Middle, action: PasteSelection }

key_bindings:
  - { key: Paste,                                         action: Paste            }
  - { key: Copy,                                          action: Copy             }
  - { key: L,              mods: Control,                 action: ClearLogNotice   }
  - { key: L,              mods: Control, mode: ~Vi,      chars: "\x0c"            }
  - { key: PageUp,         mods: Shift,   mode: ~Alt,     action: ScrollPageUp,    }
  - { key: PageDown,       mods: Shift,   mode: ~Alt,     action: ScrollPageDown   }
  - { key: Home,           mods: Shift,   mode: ~Alt,     action: ScrollToTop,     }
  - { key: End,            mods: Shift,   mode: ~Alt,     action: ScrollToBottom   }
  - { key: V,              mods: Control|Shift,           action: Paste            }
  - { key: C,              mods: Control|Shift,           action: Copy             }
  - { key: F,              mods: Control|Shift,           action: SearchForward    }
  - { key: B,              mods: Control|Shift,           action: SearchBackward   }
  - { key: C,              mods: Control|Shift, mode: Vi, action: ClearSelection   }
  - { key: Insert,         mods: Shift,                   action: PasteSelection   }
  - { key: Key0,           mods: Control,                 action: ResetFontSize    }
  - { key: Equals,         mods: Control,                 action: IncreaseFontSize }
  - { key: Plus,           mods: Control,                 action: IncreaseFontSize }
  - { key: NumpadAdd,      mods: Control,                 action: IncreaseFontSize }
  - { key: Minus,          mods: Control,                 action: DecreaseFontSize }
  - { key: NumpadSubtract, mods: Control,                 action: DecreaseFontSize }

debug:
  render_timer: false
  persistent_logging: false
  log_level: Warn
  print_events: false
    '';
    };
}
