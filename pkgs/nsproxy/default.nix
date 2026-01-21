{
  fenix,
  lib,
  pkgs,
  makeRustPlatform,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
}:
let
  toolchain = fenix.packages.${pkgs.stdenv.hostPlatform.system}.minimal.toolchain;
in
(makeRustPlatform {

  cargo = toolchain;
  rustc = toolchain;
}).buildRustPackage
  rec {
    pname = "nsproxy_core";
    version = "v3.2.3";

    src = fetchFromGitHub {
      owner = "ple1n";
      repo = "nsproxy";
      rev = version;
      fetchSubmodules = true;
      hash = "sha256-UkA0V+TqaGu9nH0Dob9fQqwSLixZkWH1+hkeqR3zZSQ=";
    };

    buildAndTestSubdir = "crates/nsproxy_core";

    cargoHash = "sha256-MT/0fTMe3raYukszMuX59d5s/QQJFv9q8uFkX4goiOI=";

    nativeBuildInputs = [
      pkg-config
      rustPlatform.bindgenHook
    ];

    buildInputs = [
      openssl
    ];

    buildFeatures = [
    ];

    meta = {
    };
  }
