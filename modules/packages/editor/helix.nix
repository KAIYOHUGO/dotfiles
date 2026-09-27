{ moduleWithSystem, ... }:
{
  flake.modules.nixos.base = moduleWithSystem (
    { inputs', self', ... }:
    {
      config,
      pkgs,
      ...
    }:
    {
      environment.variables = {
        EDITOR = "hx";
      };

      environment.systemPackages =
        with pkgs;
        [
          helix

          # rust
          rust-analyzer

          # typst
          tinymist
          typstyle

          # c/c++
          llvmPackages_21.clang-tools

          # toml
          taplo

          # nix
          nil
          nixd

          # obsidian
          markdown-oxide
        ]
        ++ [
          # discord
          self'.packages.discord-rpc-lsp

          # wakatime
          inputs'.wakatime-ls.packages.default
        ];
    }
  );
}
