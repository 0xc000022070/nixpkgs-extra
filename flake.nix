{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          config = {
            allowBroken = false;
            allowUnfree = true;
          };

          inherit system;
        };
      in {
        defaultPackage = pkgs.hello;

        packages = import ./pkgs {inherit pkgs;};
      }
    );
}
