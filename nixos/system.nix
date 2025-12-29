{
  config,
  lib,
  pkgs,
}:
{
  nix.settings = {
    trusted-users = [ "@wheel" ];
  };
}
