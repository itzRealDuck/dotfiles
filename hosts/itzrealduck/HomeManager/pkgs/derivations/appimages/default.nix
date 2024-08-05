{pkgs, ...}: {
  cheatbreaker = pkgs.callPackage ./cheatbreaker.nix {};
  badlion = pkgs.callPackage ./badlion.nix {};
}
