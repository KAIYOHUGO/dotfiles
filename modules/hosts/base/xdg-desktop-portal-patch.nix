{
  flake.modules.nixos.base =
    { config, ... }:
    {
      # xdg-desktop-portal fix
      # https://github.com/NixOS/nixpkgs/issues/189851
      systemd.user.extraConfig = ''
        DefaultEnvironment="PATH=/run/wrappers/bin:/etc/profiles/per-user/%u/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/home/%u/.local/share/flatpak/exports/bin"
      '';
    };
}
