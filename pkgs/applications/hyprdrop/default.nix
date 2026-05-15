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
    rev = "5851dfb5086b52aedc470c62b598661c4d0d279b";
    hash = "sha256-H162spKHLMx6XG7fx+EJxO4sdglYHsrbfIXdz/jalAw=";
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
