{
  description = "Nonamescm's dotfiles";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mcmojave-src.url = "github:vinceliuice/McMojave-cursors";
    mcmojave-src.flake = false;
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      mcmojave-src,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./etc/configuration.nix ];
      };
      homeConfigurations.noname = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit mcmojave-src; };
        modules = [ ./home-manager/home.nix ];
      };
    };
}
