{ pkgs, inputs, ... }:
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

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024; # 16 GiB
    }
  ];

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
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
    tree-sitter
    pptp
    ppp
    brightnessctl
    zip
    unzip
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

  virtualisation.docker = {
    enable = true;
  };

  # Version of the system when the configuration was created.
  system.stateVersion = "25.11";
}
