{
  description = "My Personal Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-flake = {
      url = "github:notashelf/neovim-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:Aylur/ags";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    neovim-flake,
    catppuccin,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    specialArgs = {inherit inputs;};
    # home-manager.extraSpecialArgs = { inherit inputs; };
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      itzreakduck = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        inherit system;
        modules = [
          ./configuration.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.users.itzreakduck.imports = [
              ./home.nix
              #  neovim-flake.homeManagerModules.default
              catppuccin.homeManagerModules.catppuccin
            ];
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }
        ];
      };
    };

    homeConfigurations.itzreakduck = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      modules = [
        # neovim-flake.homeManagerModules.default
        catppuccin.homeManagerModules.catppuccin
        ./home.nix
        # your home-manager configuration, probably where you will want to add programs.neovim-flake options
      ];
    };
  };
}
