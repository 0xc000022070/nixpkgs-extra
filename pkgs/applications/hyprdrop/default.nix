{
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
}:
rustPlatform.buildRustPackage {
  pname = "hyprdrop";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "luisnquin";
    repo = "hyprdrop";
    rev = "2d0f314a183b66d5ad77e52784dafddd87df4ab6";
    hash = "sha256-2oiv4ieVK9AVWmszFWbIsbDy+8hQnctd6aQWZbvgjW0=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  cargoLock = {
    lockFile = ./Cargo.toml;
    outputHashes = {
      "hyprland-0.4.0-beta.2" = "sha256-Vvpb5BzzTjol6UmJjkqymLlARr4gRJaS5k4aONNlcsk=";
    };
  };

  meta.mainProgram = "hyprdrop";
}
