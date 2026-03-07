{
  flake.modules.nixos.base =
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
        };
      };

      environment.systemPackages = with pkgs; [
        # drag-n-drop
        ripdrag

        # compression
        ouch

        # video
        mpv
      ];
    };

}
