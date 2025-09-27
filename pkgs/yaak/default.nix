{
  lib,
  appimageTools,
  fetchurl,
  pkgs,
}:

let
  version = "2025.5.6";
  pname = "yaak";

  src = fetchurl {
    url = "https://github.com/mountain-loop/yaak/releases/download/v${version}/yaak_${version}_amd64.AppImage";
    hash = "sha256-TnvJjGiQFUD/r+r7ufAK6FMAutoG4G9qJHK3yMfLGuk=";
  };

  appimageContents = appimageTools.extractType1 { inherit pname version src; };
in
appimageTools.wrapType1 rec {
  inherit pname version src;

  buildInputs = with pkgs; [
    webkitgtk_4_1
  ];

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/yaak.desktop -t $out/share/applications
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  
  postFixup = ''
    wrapProgram $out/bin/yaak \
      --inherit-argv0 \
      --set-default WEBKIT_DISABLE_DMABUF_RENDERER 1
  '';
}
