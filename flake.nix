{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";

    nixgrep = {
      url = "github:0xc000022070/nixgrep";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixgrep,
    nixpkgs,
    systems,
  }: let
    inherit (nixpkgs) lib;
    eachSystem = lib.genAttrs (import systems);
  in {
    overlays.default = final: prev:
      import ./pkgs/top-level {
        pkgs = final;
        lib = prev.lib;
        inherit nixgrep;
      };

    packages = eachSystem (system: let
      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowBroken = false;
          allowUnfree = true;
        };
      };
    in
      import ./pkgs/top-level {
        inherit pkgs nixgrep;
        lib = pkgs.lib;
      });
  };
}
