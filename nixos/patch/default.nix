{
  config,
  lib,
  pkgs,
  merge,
}:
let
  pop-icon-key = import ./pop-icon-key.nix {
    inherit config lib pkgs;
  };
  libinput-quirk = import ./libinput-quirk.nix {
    inherit config;
  };

in
merge [
  pop-icon-key
  libinput-quirk
]
