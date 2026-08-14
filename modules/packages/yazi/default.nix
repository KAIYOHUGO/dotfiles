{ moduleWithSystem, ... }:
{
  flake.modules.nixos.base = moduleWithSystem (
    { inputs', self', ... }:
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      programs.yazi = {
        enable = true;
        plugins = {
          inherit (pkgs.yaziPlugins) ouch starship mount;
        };
        initLua = ./init.lua;
        settings = {
          yazi = lib.importTOML ./yazi.toml;
          keymap = lib.importTOML ./keymap.toml;
          theme = {
            flavor = {
              dark = "catppuccin-mocha";
            };
          };
        };
        flavors = {
          # inherit (inputs'.yazi-flavors.packages)
          # the newest version
          inherit (self'.packages)
            catppuccin-mocha
            ;
        };

      };

      environment.systemPackages = with pkgs; [
        # drag-n-drop
        ripdrag

        # compression
        ouch

        # video
        mpv

        # testcases fail
        (inputs'.bookokrat.packages.default.overrideAttrs (old: {
          doCheck = false;
        }))
      ];
    }
  );

}
