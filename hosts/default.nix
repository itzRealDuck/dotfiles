{inputs, ...}: let
  inherit (inputs.self) lib;
in {
  itzreakduck = lib.nixosSystem {
    specialArgs = {inherit inputs lib;};
    system = null;
    modules = [
      {imports = [../options];}
      ./itzrealduck/configuration.nix
      inputs.catppuccin.nixosModules.catppuccin
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = false;
        home-manager.useUserPackages = true;
        home-manager.users.itzreakduck.imports = [
          ./itzrealduck/home.nix
          inputs.nvf.homeManagerModules.default
          inputs.catppuccin.homeManagerModules.catppuccin
          inputs.ags.homeManagerModules.default
        ];
        home-manager.extraSpecialArgs = {
          inherit inputs;
        };
      }
      {nixpkgs.hostPlatform = "x86_64-linux";}
    ];
  };
}
