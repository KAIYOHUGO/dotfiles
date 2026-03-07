{
  flake.modules.nixos.base =
    { config, ... }:
    {
      virtualisation.waydroid = {
        enable = true;
      };
    };
}
