{
  flake.modules.nixos.base =
    { config, pkgs, ... }:
    {
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

    };
}
