{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
  }: let
    inherit (nixpkgs) lib;
    eachSystem = lib.genAttrs (import systems);
  in {
    overlays.default = final: prev: (import ./pkgs/top-level {pkgs = final; inherit lib;});

    packages = eachSystem (system: let
      pkgs = import nixpkgs {
        config = {
          allowBroken = false;
          allowUnfree = true;
        };

        inherit system;
      };
    in
      import ./pkgs/top-level {inherit pkgs;});

    defaultPackage = eachSystem (system: self.packages.${system}.hyprdrop);
  };
}
