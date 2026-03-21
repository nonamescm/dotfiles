{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix = {
    optimise.automatic = true;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "-d";
    };
  };
}
