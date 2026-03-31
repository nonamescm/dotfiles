{ pkgs, neovim-nightly-overlay, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/bluetooth.nix
    ./modules/boot.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/nh.nix
    ./modules/nix-config.nix
    ./modules/users.nix
  ];

  programs.neovim = {
    enable = true;
    package = neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  environment.systemPackages = with pkgs; [
    clang
    gcc
    mesa-demos
    wget
    zsh
    ripgrep
    ly
    nvtopPackages.nvidia
    nvtopPackages.intel
    pavucontrol
    alsa-utils
    xbacklight
    libsForQt5.qt5ct
    pulseaudio
    linux-wifi-hotspot
    scala
    scala-cli
    coursier
    sbt
  ];
  programs.java = {
    enable = true;
    package = pkgs.jdk25;
  };
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Version of the system when the configuration was created.
  system.stateVersion = "25.11";
}
