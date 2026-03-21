{ ... }:
{
  xresources.properties = {
    "background" = "#13161b";
    "foreground" = "#dee9f7";
    "color0" = "#242a33";
    "color1" = "#39d1ef";
    "color2" = "#39d1ef";
    "color3" = "#41e6a2";
    "color4" = "#9ca4f7";
    "color5" = "#ef3985";
    "color6" = "#ffffff";
    "color7" = "#f7a1c5";
    "color8" = "#242a33";
    "color9" = "#39d1ef";
    "color10" = "#39d1ef";
    "color11" = "#41e6a2";
    "color12" = "#9ca4f7";
    "color13" = "#ef3985";
    "color14" = "#ffffff";
    "color15" = "#f7a1c5";

    "xterm*cursorColor" = "#dee9f7";
    "xterm*faceName" = "JetBrainsMono Nerd Font Mono:style=Medium";
    "xterm*faceSize" = 12;
    "xterm*selectToClipboard" = true;
    "xterm*eightBitInput" = false;
    "xterm*eightBitOutput" = true;
    "visualBell" = false;

    "xterm*background" = "#13161b";
    "xterm*foreground" = "#dee9f7";
    "xterm*color0" = "#242a33";
    "xterm*color1" = "#39d1ef";
    "xterm*color2" = "#39d1ef";
    "xterm*color3" = "#41e6a2";
    "xterm*color4" = "#9ca4f7";
    "xterm*color5" = "#ef3985";
    "xterm*color6" = "#ffffff";
    "xterm*color7" = "#f7a1c5";
    "xterm*color8" = "#242a33";
    "xterm*color9" = "#39d1ef";
    "xterm*color10" = "#39d1ef";
    "xterm*color11" = "#41e6a2";
    "xterm*color12" = "#9ca4f7";
    "xterm*color13" = "#ef3985";
    "xterm*color14" = "#ffffff";
    "xterm*color15" = "#f7a1c5";

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
