{
  pkgs,
  gtk3,
  lib,
  stdenv,
}:
pkgs.yaak.overrideAttrs (
  final: prev: {
    postFixup = lib.optionalString stdenv.hostPlatform.isLinux ''
      wrapProgram $out/bin/yaak-app \
        --inherit-argv0 \
        --set-default WEBKIT_DISABLE_DMABUF_RENDERER 1 \
        --prefix XDG_DATA_DIRS : "$env/share:${gtk3}/share/gsettings-schemas/${gtk3.name}" \
    '';
  }
)
