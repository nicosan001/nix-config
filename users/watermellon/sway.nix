{ libs, config, pkgs, ... }:
{
  home.file = {
    ".config/sway.config".text = ''

# Default config for sway
#
# Copy this to ~/.config/sway/config and edit it to your liking.
#
# Read `man 5 sway` for a complete reference.

### Variables
#
# Logo key. Use Mod1 for Alt.
set $mod Mod1
# Home row direction keys, like vim
set $left h
set $down j
set $up k
set $right l
# Your preferred terminal emulator
set $term alacritty
# Your preferred application launcher
# Note: pass the final command to swaymsg so that the resulting window can be opened
# on the original workspace that the command was run on.
set $menu exec wofi --show drun

### Output configuration
#
# Default wallpaper (more resolutions are available in /usr/share/backgrounds/sway/)
output * bg $HOME/Documents/wallpaper/neon-genesis.jpg fill
output eDP-1 mode 1920x1080@60Hz scale 1.5
output DP-1 mode 3840x2160 scale 1.5

font pango:Cantarell 14px
#font pango: SourceCodePro Medium 10

default_border pixel
default_floating_border pixel

gaps inner 5

set $opacity 0.9
for_window [class="terminal"] opacity $opacity
for_window [class="alacritty"] opacity $opacity

# fix for gtk applications taking like 20 seconds or more to start
## for wayland support add MOZ_ENABLE_WAYLAND=1 in /etc/environment
exec --no-startup-id systemctl --user import-enviornment DISPLAY WAYLAND_DISPLAY SWAYSOCK
exec --no-startup-id dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK
# ADD other variable support
exec ~/.config/sway/scripts/launchsway.sh
exec ~/.config/sway/scripts/repairportal.sh
# Remap Caps Lock to escape

input "type:keyboard" {
  xkb_layout us
  xkb_options caps:escape
}

# auto hide cursor
seat * hide_cursor 8000

### KEY-BINDINGS
# bindsym Shift+XF86AudioRaiseVolume exec \
	# pactl set-sink-volume @DEFAULT_SINK@ -1%
    # bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
    # bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
    # bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%


# set brightness logarithmically by factor 1.4
# .72 is just slightly bigger than 1 / 1.4
# bindsym --locked XF86MonBrightnessUp exec light -S "$(light -G | awk '{ print int(($1 + .72) * 1.4) }')"
# bindsym --locked XF86MonBrightnessDown exec light -S "$(light -G | awk '{ print int($1 / 1.4) }')"

# bindsym --locked XF86MonBrightnessUp exec light -T 1.4
# bindsym --locked XF86MonBrightnessDown exec light -T 0.72

bindsym XF86AudioRaiseVolume exec volumectl -u up
bindsym XF86AudioLowerVolume exec volumectl -u down
bindsym XF86AudioMute exec volumectl toggle-mute
bindsym XF86AudioMicMute exec volumectl -m toggle-mute

bindsym XF86MonBrightnessUp exec lightctl up
bindsym XF86MonBrightnessDown exec lightctl down

exec "avizo-service"

bindsym mod1+Shift+BackSpace exec $powermenu_path
  
## Application start
exec {
  mako
}


### Autostart
exec_always {
  autotiling
}
exec {
  swaybg
  $idle_path
} 

### IDLE & LOCK
# bindsym mod1+Shift+BackSpace exec $lock_path
set $idle_path ~/.config/sway/scripts/idle.sh
set $lock_path ~/.config/sway/scripts/lock.sh
set $powermenu_path ~/.config/sway/scripts/powermenu.sh

## fixes
for_window [app_id="flameshot"] floating enable, fullscreen disable, move absolute position 0 0, border pixel 0

# lock screen before suspend. Use loginctl lock-session to lock your screen.
# exec swayidle -w timeout 300 'swaylock -C $HOME/.config/swaylock/config.idle' timeout 420 'systemctl suspend' resume 'swaymsg "output * dpms on"' before-sleep 'swaylock'
# exec swayidle lock 'swaymsg "output * dpms on"&& swaylock' unlock 'kill -s 1 $(pgrep swaylock)'

# bindsym Mod1+l exec $HOME/.config/swaylock/lock.sh 50

#
# Example configuration:
#
#   output HDMI-A-1 resolution 1920x1080 position 1920,0
#
# You can get the names of your outputs by running: swaymsg -t get_outputs

### Idle configuration
#
# Example configuration:
#
# exec swayidle -w \
#          timeout 300 'swaylock -f -c 000000' \
#          timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
#          before-sleep 'swaylock -f -c 000000'
#
# This will lock your screen after 300 seconds of inactivity, then turn off
# your displays after another 300 seconds, and turn your screens back on when
# resumed. It will also lock your screen before your computer goes to sleep.

### Input configuration
#
# Example configuration:
#
#   input "2:14:SynPS/2_Synaptics_TouchPad" {
#       dwt enabled
#       tap enabled
#       natural_scroll enabled
#       middle_emulation enabled
#   }
#
# You can get the names of your inputs by running: swaymsg -t get_inputs
# Read `man 5 sway-input` for more information about this section.

### Key bindings
#
# Basics:
#
    # Start a terminal
    bindsym $mod+Shift+Return exec $term

    # Kill focused window
    bindsym $mod+Shift+c kill

    # Start your launcher
    bindsym $mod+p exec $menu

    # Drag floating windows by holding down $mod and left mouse button.
    # Resize them with right mouse button + $mod.
    # Despite the name, also works for non-floating windows.
    # Change normal to inverse to use left mouse button for resizing and right
    # mouse button for dragging.
    floating_modifier $mod normal

    # Reload the configuration file
    bindsym $mod+Shift+r reload

    # Exit sway (logs you out of your Wayland session)
    bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
#
# Moving around:
#
    # Move your focus around
    bindsym $mod+$left focus left
    bindsym $mod+$down focus down
    bindsym $mod+$up focus up
    bindsym $mod+$right focus right
    # Or use $mod+[up|down|left|right]
    bindsym $mod+Left focus left
    bindsym $mod+Down focus down
    bindsym $mod+Up focus up
    bindsym $mod+Right focus right

    # Move the focused window with the same, but add Shift
    bindsym $mod+Shift+$left move left
    bindsym $mod+Shift+$down move down
    bindsym $mod+Shift+$up move up
    bindsym $mod+Shift+$right move right
    # Ditto, with arrow keys
    bindsym $mod+Shift+Left move left
    bindsym $mod+Shift+Down move down
    bindsym $mod+Shift+Up move up
    bindsym $mod+Shift+Right move right
#
# Workspaces:
#
    # Switch to workspace
    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
    bindsym $mod+0 workspace number 10
    # Move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5
    bindsym $mod+Shift+6 move container to workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9
    bindsym $mod+Shift+0 move container to workspace number 10
    # Note: workspaces can have any name you want, not just numbers.
    # We just use 1-10 as the default.
#
# Layout stuff:
#
    # You can "split" the current object of your focus with
    # $mod+b or $mod+v, for horizontal and vertical splits
    # respectively.
    bindsym $mod+b splith
    bindsym $mod+v splitv

    # Switch the current container between different layout styles
    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split

    # Make the current focus fullscreen
    bindsym $mod+f fullscreen

    # Toggle the current focus between tiling and floating mode
    bindsym $mod+Shift+space floating toggle

    # Swap focus between the tiling area and the floating area
    bindsym $mod+space focus mode_toggle

    # Move focus to the parent container
    bindsym $mod+a focus parent
#
# Scratchpad:
#
    # Sway has a "scratchpad", which is a bag of holding for windows.
    # You can send windows there and get them back later.

    # Move the currently focused window to the scratchpad
    bindsym $mod+Shift+minus move scratchpad

    # Show the next scratchpad window or hide the focused scratchpad window.
    # If there are multiple scratchpad windows, this command cycles through them.
    bindsym $mod+minus scratchpad show
#
# Resizing containers:
#
mode "resize" {
    # left will shrink the containers width
    # right will grow the containers width
    # up will shrink the containers height
    # down will grow the containers height
    bindsym $left resize shrink width 10px
    bindsym $down resize grow height 10px
    bindsym $up resize shrink height 10px
    bindsym $right resize grow width 10px

    # Ditto, with arrow keys
    bindsym Left resize shrink width 10px
    bindsym Down resize grow height 10px
    bindsym Up resize shrink height 10px
    bindsym Right resize grow width 10px

    # Return to default mode
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"

#
# Status Bar:
#
# Read `man 5 sway-bar` for more information about this section.

# I manually commented this out.

# bar {
#     position top

#     # When the status_command prints a new line to stdout, swaybar updates.
#     # The default just shows the current date and time.
#     status_command while date +'%Y-%m-%d %I:%M:%S %p'; do sleep 1; done

#     colors {
#         statusline #ffffff
#         background #323232
#         inactive_workspace #32323200 #32323200 #5c5c5c
#     }
# }
bar {
     position bottom
     swaybar_command waybar
}

# include /etc/sway/config.d/*

    '';
  };
}