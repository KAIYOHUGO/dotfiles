{ pkgs, inputs }:
{
  spotify-player-git = pkgs.callPackage ./spotify-player { };
  yaak-patch = pkgs.callPackage ./yaak-patch { };
  todui = pkgs.callPackage ./todui { };
  gdlauncher = pkgs.callPackage ./gdlauncher { };
  discord-rpc-lsp = pkgs.callPackage ./discord-rpc-lsp { };
  nsproxy = pkgs.callPackage ./nsproxy { inherit (inputs) fenix; };
}
