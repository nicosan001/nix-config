{ libs, config, pkgs, ... }:
{


  home.file = {
    ".config/sway/scripts/idle.sh".text = ''
#!/bin/sh
swayidle \
timeout 300 '~/.config/sway/scripts/lock.sh --grace 10 --fade-in 0' \
timeout 320 'swaymsg "output * dpms off"' \
resume 'swaymsg "output * dpms on"' \
before-sleep '~/.config/sway/scripts/lock.sh --fade-in 0'
    '';
}


  home.file = {
    ".config/sway/scripts/launchsway.sh".text = ''
#!/bin/bash

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export GDK_BACKEND="wayland,x11"
export MOZ_ENABLE_WAYLAND=1

## exec sway
    '';
}


  home.file = {
    ".config/sway/scripts/lock.sh".text = ''
#!/bin/sh
swaylock -d --screenshots --clock --indicator-idle-visible \
--indicator-radius 100 \
--indicator-thickness 5 \
--ignore-empty-password \
--bs-hl-color d65d0e \
--ring-color 7c6f64 \
--ring-clear-color 7c6f64 \
--ring-caps-lock-color 7c6f64 \
--ring-ver-color 7c6f64 \
--ring-wrong-color 7c6f64 \
--key-hl-color ebdbb2 \
--text-color fabd2f \
--text-clear-color fabd2f \
--text-caps-lock-color fabd2f \
--text-ver-color 83a598 \
--text-wrong-color fb4934 \
--font Iosevka Term Regular \
--line-color 00000000 \
--line-clear-color 00000000 \
--line-caps-lock-color 00000000 \
--line-ver-color 00000000 \
--line-wrong-color 00000000 \
--inside-color 00000088 \
--inside-clear-color 00000088 \
--inside-ver-color 00000088 \
--inside-wrong-color 00000088 \
--separator-color 00000000 \
--fade-in \
--effect-scale 0.5 --effect-blur 7x3 --effect-scale 2 \
--effect-vignette 0.5:0.5 \
"$@"
    '';
}


  home.file = {
    ".config/sway/scripts/powermenu.sh".text = ''
#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout" | wofi -i --dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                ;&
        reboot)
                ;&
        suspend)
                systemctl $op
                ;;
        lock)
		            ~/.config/sway/scripts/lock.sh
                ;;
        logout)
                swaymsg exit
                ;;
esac
    '';
}


  home.file = {
    ".config/sway/scripts/repairportal.sh".text = ''
#!/bin/bash
killall xdg-desktop-portal
systemctl --user restart pipewire
    '';
}

}
