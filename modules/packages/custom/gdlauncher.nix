{
  perSystem =
    { pkgs, ... }:
    {
      packages.gdlauncher = pkgs.callPackage (
        { appimageTools, fetchurl }:
        let
          pname = "gdlauncher";
          version = "2.0.28";

          src = fetchurl {
            url = "https://cdn-raw.gdl.gg/launcher/GDLauncher__${version}__linux__x64.AppImage";
            hash = "sha256-0OS4V5Wyghi+5ZQwvHz/CfNzPuLALjXDq2kAV6mGmkc=";
          };
          appimageContents = appimageTools.extractType2 { inherit pname version src; };
        in
        appimageTools.wrapType2 {
          inherit pname version src;
          extraInstallCommands = ''
            install -m 444 -D ${appimageContents}/@gddesktop.desktop -t $out/share/applications
            substituteInPlace $out/share/applications/@gddesktop.desktop \
              --replace-fail 'Exec=AppRun' 'Exec=${pname}'
            mkdir -p $out/share/pixmaps
            cp ${appimageContents}/@gddesktop.png $out/share/pixmaps/
          '';
        }
      ) { };
    };
}
