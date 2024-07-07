{
  pkgs,
  options,
  ...
}:
with options; {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
