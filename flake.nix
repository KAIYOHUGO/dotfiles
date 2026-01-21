{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rota = {
      url = "github:kaiyohugo/rota";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wakatime-ls = {
      url = "github:mrnossiom/wakatime-ls";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spotify-player = {
      url = "github:aome510/spotify-player";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      rota,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      # Supported systems for your flake packages, shell, etc.
      systems = [
        "x86_64-linux"
      ];
      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;
      merge = nixpkgs.lib.lists.foldl nixpkgs.lib.attrsets.recursiveUpdate { };
    in
    {
      packages = forAllSystems (
        system:
        import ./pkgs {
          pkgs = nixpkgs.legacyPackages.${system};
          inputs = inputs;
        }
      );

      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations.cx5500 = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs merge; };
        modules = [
          ./nixos
          ./hosts/cx5500
          rota.nixosModules.${system}
        ];
      };
    };
}
