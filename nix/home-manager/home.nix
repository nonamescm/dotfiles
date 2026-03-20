let
  MCMOJAVE = import ./mccmojave.nix;
in
{ config, pkgs, ... }: {
  home.username = "noname";
  home.homeDirectory = "/home/noname";
  home.stateVersion = "25.11";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.sessionVariables = {
    EDITOR = "nvim";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
  programs.home-manager.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    package = MCMOJAVE;
    name = "McMojave Cursors";
    size = 10;
  };

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
  };

  qt = {
    enable = true;
    style.package = with pkgs; [ darkly-qt5 darkly ];
    platformTheme.name = "qtct";
  };

  programs.git = {
    enable = true;
    settings.user.name = "nonamescm";
    settings.user.email = "snadragona12bionic@gmail.com";
  };

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    alacritty
    waybar
    swaybg
    chromium
    dunst
    ghc
    eww
    discord
    rofi
    feh
    flameshot
    grim
  ];

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        useGrimAdapter = true;
        disabledGrimWarning = true;
        drawColor = "#ff0000";
        savePath = "/home/noname/Downloads";
      };
    };
  };
}
