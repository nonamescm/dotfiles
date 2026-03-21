{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "waybar & zsh -c \"$(sleep 5; flameshot) & disown\""
      "swaybg -i ~/.config/hypr/fractal2.png"
    ];

    env = [ "XCURSOR_SIZE,24" ];

    input = {
      kb_layout = "br";
      follow_mouse = 1;
      touchpad.natural_scroll = false;
      sensitivity = 0;
    };

    general = {
      gaps_in = 0;
      gaps_out = 0;
      border_size = 1;
      "col.inactive_border" = "rgba(1a1d22ff)";
      "col.active_border" = "rgba(242a33ff)";
      layout = "dwindle";
    };

    decoration = {
      shadow = {
        enabled = false;
        range = 30;
        render_power = 10000;
        color = "rgb(000000)";
      };
    };

    animations = {
      enabled = true;
      animation = [
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    windowrule = [
      "no_anim on, stay_focused on, match:title ^(flameshot)$"
      "opacity 0, match:class ^(xwaylandvideobridge)$"
      "no_anim on , match:class ^(xwaylandvideobridge)$"
      "no_initial_focus on, match:class ^(xwaylandvideobridge)$"
      "max_size 1 1, match:class ^(xwaylandvideobridge)$"
      "no_blur on, match:class ^(xwaylandvideobridge)$"
    ];

    layerrule = [
      "blur on, match:class rofi"
    ];

    "$mod" = "SUPER";

    bind = [
      "$mod, Return, exec, kitty"
      "$mod, Q, killactive, "
      "$mod, M, exit,"
      "$mod, S, togglefloating"
      "$mod, F, fullscreen"
      "ALT, Space, exec, rofi -show drun"
      "$mod, /, exec, rofi -show drun"
      "$mod SHIFT, P, pseudo,"
      "$mod SHIFT, C, exec, bash -c \"wl-paste | wl-copy\""

      # Backlight
      ", XF86MonBrightnessUp, exec, xbacklight -inc 5"
      ", XF86MonBrightnessDown, exec, xbacklight -dec 5"
      ", Print, exec, flameshot gui"

      # Music
      ", XF86AudioRaiseVolume, exec, amixer sset Master 2%+"
      ", XF86AudioLowerVolume, exec, amixer sset Master 2%-"
      ", XF86AudioMute, exec, amixer sset Master toggle"

      # Move focus with mainMod + arrow keys
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"

      # Scroll through existing workspaces with mainMod + scroll
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "bindm = $mod, mouse:273, resizewindow"
    ];
  };
}
