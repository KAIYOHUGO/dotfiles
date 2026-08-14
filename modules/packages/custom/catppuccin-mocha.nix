{
  perSystem =
    { pkgs, ... }:
    {
      packages.catppuccin-mocha = pkgs.callPackage (
        { pkgs, fetchFromGitHub }:
        let
          flavor = "catppuccin-mocha";
        in
        pkgs.stdenv.mkDerivation {
          pname = "yazi-flavor-${flavor}";
          version = "aug-14";
          src = fetchFromGitHub {
            owner = "yazi-rs";
            repo = "flavors";
            rev = "be0b21d0873092a63946cc2678dd700aac945902";
            hash = "sha256-Dy73TfcrcbCXY9lwDszNgAKLiCAHf1KIwC4Q5U6k21E=";
          };

          installPhase = ''
            mkdir -p $out
            cp $src/${flavor}.yazi/* $out/
          '';
        }
      ) { };
    };
}
