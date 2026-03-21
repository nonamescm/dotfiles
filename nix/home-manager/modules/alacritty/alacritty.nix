{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = import ./bloop.nix;

      env = {
        TERM = "xterm-256color";
      };

      window = {
        opacity = 1;
        dynamic_padding = false;
        padding = {
          x = 1;
          y = 1;
        };
      };

      font = {
        size = 10;
        normal = {
          family = "FiraCode Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        offset = {
          x = 0;
          y = 0;
        };
      };

      cursor.style = {
        shape = "Beam";
      };
    };
  };
}
