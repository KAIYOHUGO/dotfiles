{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "discord-rpc-lsp";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "zerootoad";
    repo = pname;
    rev = version;
    hash = "sha256-1Zw+F/EfYjHHU0AYlAHT7g1sbuJrHRtGp9E1u9EPW8E=";
  };
  vendorHash = "sha256-vr+uwkEJJ926qCAUacF4TC4OMqqVAOoT6Osnvybuf9Y=";

  preBuild = ''
    go mod tidy
  '';
  proxyVendor = true;
}
