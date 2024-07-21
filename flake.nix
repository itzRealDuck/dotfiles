{
  description = "My Personal Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    };
    nvf = {
      url = "github:notashelf/nvf";
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
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvf,
    catppuccin,
    ags,
    ...
  } @ inputs: let
    system = null;

    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      itzreakduck = lib.nixosSystem {
        specialArgs = {inherit inputs lib;};
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
              nvf.homeManagerModules.default
              catppuccin.homeManagerModules.catppuccin
              ags.homeManagerModules.default
            ];
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }
          {nixpkgs.hostPlatform = "x86_64-linux";}
        ];
      };
    };

    homeConfigurations.itzreakduck = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      modules = [
        nvf.homeManagerModules.default
        catppuccin.homeManagerModules.catppuccin
        ./home.nix
      ];
    };
  };
}
