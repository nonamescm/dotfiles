{ ... }:
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 1;
        spacing = 0;

        modules-left = [ "river/tags" ];
        modules-center = [ "custom/nixos" ];
        modules-right = [
          "tray"
          "group/misc"
        ];

        "river/tags" = {
          hide-vacant = true;
          tag-labels = [
            "󰈹"
            ""
            "󰙯"
            "󰊖"
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "clock" = {
          format = "{:%H\n%M}";
          tooltip-format = "{:%D}";
        };

        "custom/nixos" = {
          format = "  ";
          on-click = "rofi -show drun";
        };

        "group/misc" = {
          orientation = "inherit";
          modules = [
            "network"
            "group/audio"
            "group/brightness"
            "battery"
            "clock"
          ];
        };

        "group/audio" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 400;
            children-class = "audio";
            transition-left-to-right = false;
          };
          modules = [
            "pulseaudio"
            "pulseaudio/slider"
          ];
        };

        "group/brightness" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 400;
            children-class = "brightness";
            transition-left-to-right = false;
          };
          modules = [
            "backlight"
            "backlight/slider"
          ];
        };

        "battery" = {
          format = "{icon}";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip-format = "{capacity}";
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = [
            "󰃚"
            "󰃛"
            "󰃜"
            "󰃝"
            "󰃞"
            "󰃟"
            "󰃠"
          ];
        };

        "backlight/slider" = {
          min = 0;
          max = 100;
          orientation = "vertical";
        };

        "tray" = {
          icon-size = 17;
          spacing = 10;
          show-passive-items = true;
        };

        "pulseaudio" = {
          format = "{icon}";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          format-muted = "󰖁";
        };

        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "vertical";
        };

        "network" = {
          interface = "wl*";
          format-icons = [
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-wifi = "{icon}";
          format-disconnected = "󰤭";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          on-click = "alacritty --command=nmtui";
        };
      };
    };
  };
}
