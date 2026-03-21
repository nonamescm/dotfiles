{ ... }:
let
  bloop = import ../alacritty/bloop.nix;
in
{
  programs.kitty = {
    enable = true;
    settings = {
      # Primary
      background = bloop.primary.background;
      foreground = bloop.primary.foreground;
      color0 = bloop.normal.black;
      color1 = bloop.normal.red;
      color2 = bloop.normal.green;
      color3 = bloop.normal.yellow;
      color4 = bloop.normal.blue;
      color5 = bloop.normal.magenta;
      color6 = bloop.normal.cyan;
      color7 = bloop.normal.white;
      color8 = bloop.bright.black;
      color9 = bloop.bright.red;
      color10 = bloop.bright.green;
      color11 = bloop.bright.yellow;
      color12 = bloop.bright.blue;
      color13 = bloop.bright.magenta;
      color14 = bloop.bright.cyan;
      color15 = bloop.bright.white;

      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = 10;
      background_opacity = "0.8";
      cursor_shape = "beam";
      term = "xterm-256color";
    };
  };
}
