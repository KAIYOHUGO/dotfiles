{
  config,
  lib,
  pkgs,
}:
{
  programs.localsend.enable = true;

  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-rime
    ];
    fcitx5.waylandFrontend = true;
  };

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.space-mono

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  # fix font quirk in some flatpak app
  system.userActivationScripts.flatpakFont = {
    text = ''
      mkdir ~/.local/share/fonts
      cp -L /run/current-system/sw/share/X11/fonts/* ~/.local/share/fonts/
    '';
    deps = [ ];
  };

  # xdg-desktop-portal fix
  # https://github.com/NixOS/nixpkgs/issues/189851
  systemd.user.extraConfig = ''
    DefaultEnvironment="PATH=/run/wrappers/bin:/etc/profiles/per-user/%u/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/home/%u/.local/share/flatpak/exports/bin"
  '';

  programs.direnv.enable = true;

}
