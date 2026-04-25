{
  pkgs,
  config,
  username,
  dotfiles,
  inputs,
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

  home.packages = [
    inputs.zig-overlay.packages.x86_64-linux.master
    inputs.zls-overlay.packages.x86_64-linux.default

    pkgs.alacritty
    pkgs.chromium
    pkgs.discord
    pkgs.dunst
    pkgs.eww
    pkgs.feh
    pkgs.flameshot
    pkgs.ghc
    pkgs.git
    pkgs.grim
    pkgs.kitty
    pkgs.macchina
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt
    pkgs.nixfmt-tree
    pkgs.rofi
    pkgs.rustup
    pkgs.steam
    pkgs.steam-run
    pkgs.swaybg
    pkgs.texliveFull
    pkgs.waybar
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
