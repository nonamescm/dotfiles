{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = removeAttrs (import ../theme/bloop.nix) [ "secondary" ];

      env = {
        TERM = "xterm-256color";
      };

      window = {
        opacity = 0.9;
        dynamic_padding = false;
        padding = {
          x = 1;
          y = 1;
        };
      };

      font = {
        size = 12;
        normal = {
          family = "Iosevka Custom";
          style = "Medium";
        };
        bold = {
          family = "Iosevka Custom";
          style = "Bold";
        };
        italic = {
          family = "Iosevka Custom";
          style = "Medium";
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
