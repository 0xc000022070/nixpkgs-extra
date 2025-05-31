{
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
}:
rustPlatform.buildRustPackage {
  pname = "hyprdrop";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "kjlo";
    repo = "hyprdrop";
    rev = "5516c9cde8bd3c5632f09b651dc68bb68743096f";
    hash = "sha256-g8z9H3aY9LhfkklR98d+cAqjT4yC22BBYfuLdjubhVY=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "hyprland-0.4.0-beta.2" = "sha256-J7xptA7K9i1kxG4K9+4v2m+Y+XIzNILxlm67S9+FEGc=";
    };
  };

  meta.mainProgram = "hyprdrop";
}
