{
  pkgs,
  lib,
  inputs,
  ...
}: let
in {
  nixpkgs.overlays = [
    (self: super: {
      awesome = super.awesome.overrideAttrs (_: {
        src = super.fetchFromGitHub {
          owner = "awesomewm";
          repo = "awesome";
          rev = "master";
          sha256 = "1i7ajmgbsax4lzpgnmkyv35x8vxqi0j84a14k6zys4blx94m9yjf";
        };
      });
    })
  ];
}
