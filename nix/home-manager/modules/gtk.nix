{ pkgs, config, ... }:
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
    font = {
      name = "Sans";
      size = 11;
    };
    gtk4.theme = config.gtk.theme;
    gtk3.extraConfig = {
      gtk-decoration-layout = "";
    };
  };
}
