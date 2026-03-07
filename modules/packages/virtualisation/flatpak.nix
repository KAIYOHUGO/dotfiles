{
  flake.modules.nixos.base =
    { config, ... }:
    {
      services.flatpak.enable = true;
    };
}
