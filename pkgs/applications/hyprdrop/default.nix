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
    rev = "4799f218b2d06e709ff26967e78f37372c57c169";
    hash = "sha256-JFubu+zwtJ7Ac4jyPJ4c0Rce0CkPmoCHpxEc+zyfGnc=";
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
}
