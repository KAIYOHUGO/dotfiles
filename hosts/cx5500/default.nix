{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
let
  hardware = import ./hardware-configuration.nix {
    inherit config lib pkgs modulesPath;
  };

  keymap = import ./keymap.nix {
    inherit config lib pkgs;
  };
in hardware // keymap // {
  
}
