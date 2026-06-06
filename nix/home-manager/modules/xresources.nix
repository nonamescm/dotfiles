{ ... }:
let
  colors = import ./theme/bloop.nix;
in
{
  xresources.properties = {
    "background" = colors.primary.background;
    "foreground" = colors.primary.foreground;
    "color0" = colors.normal.black;
    "color1" = colors.normal.red;
    "color2" = colors.normal.green;
    "color3" = colors.normal.yellow;
    "color4" = colors.normal.blue;
    "color5" = colors.normal.magenta;
    "color6" = colors.normal.cyan;
    "color7" = colors.normal.white;
    "color8" = colors.bright.black;
    "color9" = colors.bright.red;
    "color10" = colors.bright.green;
    "color11" = colors.bright.yellow;
    "color12" = colors.bright.blue;
    "color13" = colors.bright.magenta;
    "color14" = colors.bright.cyan;
    "color15" = colors.bright.white;

    "xterm*background" = colors.primary.background;
    "xterm*foreground" = colors.primary.foreground;
    "xterm*color0" = colors.normal.black;
    "xterm*color1" = colors.normal.red;
    "xterm*color2" = colors.normal.green;
    "xterm*color3" = colors.normal.yellow;
    "xterm*color4" = colors.normal.blue;
    "xterm*color5" = colors.normal.magenta;
    "xterm*color6" = colors.normal.cyan;
    "xterm*color7" = colors.normal.white;
    "xterm*color8" = colors.bright.black;
    "xterm*color9" = colors.bright.red;
    "xterm*color10" = colors.bright.green;
    "xterm*color11" = colors.bright.yellow;
    "xterm*color12" = colors.bright.blue;
    "xterm*color13" = colors.bright.magenta;
    "xterm*color14" = colors.bright.cyan;
    "xterm*color15" = colors.bright.white;

    "xterm*cursorColor" = colors.primary.foreground;
    "xterm*faceName" = "JetBrainsMono Nerd Font Mono:style=Medium";
    "xterm*faceSize" = 12;
    "xterm*selectToClipboard" = true;
    "xterm*eightBitInput" = false;
    "xterm*eightBitOutput" = true;
    "visualBell" = false;

    "xterm*VT100.Translations" = ''
      #override \
            Ctrl Shift <Key>V:    insert-selection(CLIPBOARD) \n\
            Ctrl Shift <Key>C:    copy-selection(CLIPBOARD) \n\
            Ctrl Shift <Key>Up:   scroll-back(1, halfpage) \n\
            Ctrl Shift <Key>Down: scroll-forw(1, halfpage) \n\
            Ctrl Shift <Key>+:    larger-vt-font() \n\
            Ctrl Shift <Key>-:    smaller-vt-font() '';
  };
}
