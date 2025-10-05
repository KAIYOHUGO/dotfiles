{
  config,
  lib,
  pkgs,
}:
let
  pop-icon-key = import ./pop-icon-key.nix {
    inherit config lib pkgs;
  };

in
pop-icon-key
// {
}
