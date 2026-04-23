{
  pkgs,
  config,
  username,
  dotfiles,
  ...
}:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  home.sessionVariables = {
    EDITOR = "nvim";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  imports = [
    ./modules/alacritty/alacritty.nix
    ./modules/kitty/kitty.nix
    ./modules/waybar/waybar.nix
    ./modules/hyprland/hyprland.nix
    ./modules/flameshot.nix
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/mcmojave.nix
    ./modules/qt.nix
    ./modules/rofi.nix
    ./modules/zsh/zsh.nix
    ./modules/xresources.nix
  ];

  programs.home-manager.enable = true;
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    git
    steam
    steam-run
    kitty
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
    nixd
    nil
    nixfmt
    nixfmt-tree
    zig
    zls
    rustup
    macchina
		texliveFull
  ];

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
    recursive = false;
  };

  home.file.".config/macchina" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/macchina";
    recursive = false;
  };
}
