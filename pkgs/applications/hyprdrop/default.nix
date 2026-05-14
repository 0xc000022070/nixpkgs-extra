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
    rev = "1e61d5b6014f8e82eef8ea35a4285fa340aa5c86";
    hash = "sha256-vIsutW5U8BDTwEuwOafTAxFZdfQ1Hh8nCs3WlBv1agY=";
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
