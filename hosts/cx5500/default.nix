{
  config,
  lib,
  pkgs,
  modulesPath,
  merge,
  ...
}:
let
  hardware = import ./hardware-configuration.nix {
    inherit
      config
      lib
      pkgs
      modulesPath
      ;
  };

  keymap = import ./keymap.nix {
    inherit config lib pkgs;
  };

  audio-patch = import ./audio-patch.nix {
    inherit config;
  };
in
merge [
  hardware
  keymap
  audio-patch
]
