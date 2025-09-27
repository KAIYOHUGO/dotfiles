{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixos-cosmic.url = "github:jerbaroo/nixos-cosmic";
    # nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs = {
    self,
    nixpkgs,
  } @ inputs: let
    inherit (self) outputs;

    # Supported systems for your flake packages, shell, etc.
    systems = [
      "x86_64-linux"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations.cx5500 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs outputs;};
      modules = [
        ./nixos/configuration.nix
        ./hosts/cx5500/hardware-configuration.nix

        # cosmic
        # {
        #   nix.settings = {
        #     substituters = [ "https://cosmic.cachix.org/" ];
        #     trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
        #   };
        # }
        # nixos-cosmic.nixosModules.default
      ];
    };
  };
}
