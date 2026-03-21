# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/audio.nix
    ./modules/bluetooth.nix
    ./modules/boot.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/nix-config.nix
    ./modules/users.nix
  ];

  environment.systemPackages = with pkgs; [
    clang
    gcc
    mesa-demos
    neovim
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
  ];
  programs.zsh.enable = true;
  programs.firefox.enable = true;

  # Version of the system when the configuration was created.
  system.stateVersion = "25.11";
}
