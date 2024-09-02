{
  pkgs,
  config,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (self: super: {
      discord = super.discord.overrideAttrs (
        _: {
          src = builtins.fetchTarball {
            url = https://discord.com/api/download?platform=linux&format=tar.gz;
            sha256 = "0dgrvchmidvgngxm7gy21wn1gx6sx8w85vlr8pxdf55mdjcnn3ib";
          };
        }
      );
    })
  ];
}
