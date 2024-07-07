{
  options,
  pkgs,
  ...
}:
with options; {
  nixpkgs.config = {
    allowBroken = true;
    allowUnfreePredicate = _: true;
    allowUnfree = true;
  };
}
