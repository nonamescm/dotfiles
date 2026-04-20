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
    iosevka-custom = {
      url = "github:nonamescm/iosevka-custom";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
			iosevka-custom,
      neovim-nightly-overlay,
      ...
    }@inputs:
    let
      username = "noname";
      dotfiles = "/home/${username}/Desktop/dotfiles";
      gitUsername = "nonamescm";
      gitEmail = "snadragona12bionic@gmail.com";
    in
    {

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit neovim-nightly-overlay;
					inherit iosevka-custom;
          inherit username;
          inherit dotfiles;
        };
        modules = [ ./nix/etc/configuration.nix ];
      };
      homeConfigurations.noname = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {
          inherit inputs;
          inherit username;
          inherit dotfiles;
          inherit gitUsername;
          inherit gitEmail;
        };
        modules = [ ./nix/home-manager/home.nix ];
      };
    };
}
