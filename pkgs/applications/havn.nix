{
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
}:
rustPlatform.buildRustPackage rec {
  pname = "havn";
  version = "0.1.9";

  src = fetchFromGitHub {
    owner = "mrjackwills";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-FRwCLumyxt4rMiAKPRE3IqTQmrU9kiTY4H+e2jbZEIw=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  doCheck = false;

  cargoSha256 = "sha256-rAQf/Dc69bi184vhtf0fJq9/5a0MSUsVIVhiLXj53u8=";
}
