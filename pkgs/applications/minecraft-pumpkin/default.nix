{
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
}:let 
cargoLockFile =./Cargo.toml;
in
rustPlatform.buildRustPackage {
  pname = "minecraft-pumpkin";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "Snowiiii";
    repo = "Pumpkin";
    rev = "69156034e021aaa89ee621d20f5716bca50632be";
    hash = "sha256-q4d0aSGe9lnGsAKtkac8KYZOMOkqob2kq7yUfaaQ+K4=";
  };

  postPatch = ''
    ln -s ${cargoLockFile} Cargo.lock
  '';

  nativeBuildInputs = [
    pkg-config
  ];

  doCheck = false;

  cargoLock = {
    lockFile = cargoLockFile;
    outputHashes = {
      "fastnbt-2.5.0" = "sha256-E4WI6SZgkjqUOtbfXfKGfpFH7btEh5V0KpMXSIsuh08=";
    };
  };
}
