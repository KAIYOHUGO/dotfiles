{
  flake.modules.nixos.base = { config, pkgs, ... }: {
    networking.nftables.enable = true;
  };
}
