{
  description = "Nonamescm's dotfiles";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mcmojave-src = {
      url = "github:vinceliuice/McMojave-cursors";
      flake = false;
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      mcmojave-src,
      neovim-nightly-overlay,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit neovim-nightly-overlay; };
        modules = [ ./nix/etc/configuration.nix ];
      };
      homeConfigurations.noname = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit mcmojave-src; };
        modules = [ ./nix/home-manager/home.nix ];
      };
    };
}
