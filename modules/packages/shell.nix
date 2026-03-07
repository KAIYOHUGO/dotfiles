{
  flake.modules.nixos.base =
    { config, pkgs, ... }:
    {
      users.users.hugo.shell = pkgs.nushell;
      environment.systemPackages = with pkgs; [
        nushell
        ghostty
        bottom
        trash-cli
        zoxide
        carapace
        atuin
        starship
      ];
    };
}
