{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    # Use pkgs.rofi-wayland if you are on Wayland
    package = pkgs.rofi;

    extraConfig = {
      font = "FiraCode Nerd Font 15";
      show-icons = true;
      icon-theme = "Papirus";
      display-drun = "";
      drun-display-format = " {name}";
      disable-history = false;
      fullscreen = false;
      hide-scrollbar = true;
      sidebar-mode = false;
    };

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        # The @theme "/dev/null" is handled by Home Manager starting with a clean slate

        "*" = {
          background = mkLiteral "#13161bbb";
          background-alt = mkLiteral "#13161bbb";
          foreground = mkLiteral "#dee9f7";
          foreground-alt = mkLiteral "#bec9d7";
          border-alt = mkLiteral "#13161bbb";
          border = mkLiteral "#242a33";
          selected = mkLiteral "#242a3377";
          urgent = mkLiteral "#ef3985";
        };

        "element-text, element-icon" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "window" = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
          border = mkLiteral "2px";
          border-color = mkLiteral "@border";
          border-radius = mkLiteral "5px";
          height = mkLiteral "60%";
          width = mkLiteral "46.66%";
          location = mkLiteral "Center";
          x-offset = mkLiteral "0%";
          y-offset = mkLiteral "0%";
        };

        "prompt" = {
          enabled = true;
          padding = mkLiteral "0% 1% 0% 0%";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
        };

        "entry" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          placeholder-color = mkLiteral "@foreground";
          expand = true;
          horizontal-align = mkLiteral "0";
          vertical-align = mkLiteral "0.5";
          placeholder = "Search Applications";
          padding = mkLiteral "0.05% 0% 0% 0%";
          blink = false;
          cursor-width = mkLiteral "1px";
          cursor-color = mkLiteral "@foreground-alt";
        };

        "inputbar" = {
          children = map mkLiteral [
            "prompt"
            "entry"
          ];
          background-color = mkLiteral "@selected";
          text-color = mkLiteral "@foreground";
          expand = false;
          border = mkLiteral "0%";
          border-radius = mkLiteral "0.5%";
          border-color = mkLiteral "@border-alt";
          padding = mkLiteral "1%";
          position = mkLiteral "center";
        };

        "listview" = {
          background-color = mkLiteral "transparent";
          columns = 2;
          spacing = mkLiteral "1%";
          cycle = false;
          dynamic = true;
          layout = mkLiteral "vertical";
        };

        "mainbox" = {
          background-color = mkLiteral "transparent";
          children = map mkLiteral [
            "inputbar"
            "listview"
          ];
          spacing = mkLiteral "2%";
          padding = mkLiteral "2.5% 2% 2.5% 2%";
        };

        "element" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          orientation = mkLiteral "horizontal";
          border-radius = mkLiteral "0%";
          padding = mkLiteral "1% 1% 1% 1%";
        };

        "element-icon" = {
          background-color = mkLiteral "transparent";
          size = mkLiteral "4%";
          border = mkLiteral "0px";
        };

        "element-text" = {
          background-color = mkLiteral "transparent";
          expand = true;
          horizontal-align = mkLiteral "0";
          vertical-align = mkLiteral "0.5";
          margin = mkLiteral "0.5% 1% 0% 0.5%";
        };

        "element normal.urgent, element alternate.urgent" = {
          background-color = mkLiteral "@urgent";
          text-color = mkLiteral "@foreground";
          border-radius = mkLiteral "1%";
        };

        "element normal.active, element alternate.active" = {
          background-color = mkLiteral "@background-alt";
          text-color = mkLiteral "@foreground";
        };

        "element selected" = {
          background-color = mkLiteral "@selected";
          text-color = mkLiteral "@foreground";
          border-radius = mkLiteral "0.4%";
          border-color = mkLiteral "@border-alt";
        };

        "element selected.urgent" = {
          background-color = mkLiteral "@urgent";
          text-color = mkLiteral "@foreground";
        };

        "element selected.active" = {
          background-color = mkLiteral "@background-alt";
          color = mkLiteral "@foreground";
        };
      };
  };
}
