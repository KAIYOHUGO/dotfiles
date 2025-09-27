{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  cmake,
  dbus,
  fontconfig,
  # deps for audio backends
  alsa-lib,
}:
rustPlatform.buildRustPackage rec {
  pname = "spotify-player";
  version = "0.21.0-git";

  src = fetchFromGitHub {
    owner = "aome510";
    repo = "spotify-player";
    rev = "77af13b48b2a03e61fef1cffea899929057551dc";
    # tag = "v${version}";
    hash = "sha256-hU1VVM4PfjUx6ckjwpdcrIIiInfB/B4+Dhb4dc9juaE=";
  };

  cargoHash = "sha256-YarKRApcQHom3AQIirqGdmUOuy5B+BRehLijvF/GRPc=";

  nativeBuildInputs = [
    pkg-config
    cmake
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    openssl
    dbus
    fontconfig
    alsa-lib
  ];

  buildFeatures = [
    "image"
    "fzf"
  ];

  meta = {
    homepage = "https://github.com/aome510/spotify-player";
    mainProgram = "spotify_player";
    license = lib.licenses.mit;
  };
}
