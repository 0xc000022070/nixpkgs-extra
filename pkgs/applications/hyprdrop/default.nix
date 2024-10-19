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
    rev = "f970890e8a3d91c0458b2b0fae9302d5e645f9b4";
    hash = "sha256-ZAkOmV63nWnACbtFzv3ob2A7SjbDVOmuLUp2wcFT8BA=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  cargoLock = {
    lockFile = ./Cargo.toml;
    outputHashes = {
      "hyprland-0.4.0-alpha.3" = "sha256-6tqGJ7iC0EPTJP174cSwB9CEvJ0KQ6Um6HMHcIuT/Js=";
    };
  };
}
