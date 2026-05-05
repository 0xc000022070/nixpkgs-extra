{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";

    adb-mcp = {
      url = "github:cuentacero/adb-mcp";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
    nixgrep = {
      url = "github:0xc000022070/nixgrep";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-scripts = {
      url = "github:0xc000022070/nix-scripts";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
    passgen = {
      url = "github:0xc000022070/passgen";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
    senv = {
      url = "github:luisnquin/senv";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    grub-themes = {
      url = "github:luisnquin/grub-themes";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
    hyprstfu = {
      url = "github:luisnquin/hyprstfu";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
  };

  outputs = inputs @ {
    self,
    nixgrep,
    nixpkgs,
    systems,
    ...
  }: let
    inherit (nixpkgs) lib;
    eachSystem = lib.genAttrs (import systems);

    externalOverlays = [
      inputs.adb-mcp.overlays.default
      inputs.nix-scripts.overlays.default
      inputs.passgen.overlays.default
      inputs.senv.overlays.default
      inputs.grub-themes.overlays.default
      inputs.hyprstfu.overlays.default
    ];

    localOverlay = final: prev:
      import ./pkgs/top-level {
        pkgs = final;
        lib = prev.lib;
        inherit nixgrep;
      };
  in {
    overlays.default = lib.composeManyExtensions (
      externalOverlays
      ++ [
        localOverlay
      ]
    );

    packages = eachSystem (system: let
      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowBroken = false;
          allowUnfree = true;
        };

        overlays = [
          self.overlays.default
        ];
      };
    in
      import ./pkgs/top-level {
        inherit pkgs nixgrep;
        lib = pkgs.lib;
      });
  };
}
