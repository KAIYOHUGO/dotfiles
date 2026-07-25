{
  flake.modules.nixos.base =
    { config, pkgs, ... }:
    {
      i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.addons = with pkgs; [
          fcitx5-rime
          fcitx5-mozc
        ];
        fcitx5.waylandFrontend = true;
      };
    };
}
