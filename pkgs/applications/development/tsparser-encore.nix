{
  rustPlatform,
  fetchFromGitHub,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "tsparser-encore";
  version = "1.39.0";

  src = let
    fullSrc = fetchFromGitHub {
      name = "encore-source";
      owner = "encoredev";
      repo = "tsparser";
      rev = "v${version}";
      hash = "sha256-71vzo52vV4VilBnLZxIWDKIY08rfTavMZ57qgi4pip8=";
    };
  in "${fullSrc}/tsparser";

  cargoHash = "";

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "ast_node-0.9.5" = "sha256-FjGoykmceDCfjdoDyevTOrk6wrBJ0pttppcP2x9hQzw=";
      "better_scoped_tls-0.1.1" = "sha256-FjGoykmceDCfjdoDyevTOrk6wrBJ0pttppcP2x9hQzw=";
    };
  };
}
