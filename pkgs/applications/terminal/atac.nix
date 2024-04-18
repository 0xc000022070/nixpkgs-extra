{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "atac";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "Julien-cpsn";
    repo = "ATAC";
    rev = "v${version}";
    hash = "sha256-yR+w6zrX7XHrK6XGWM7J74XPxGEmy8Gf6guOH/Du6rc=";
  };

  doCheck = true;
  cargoSha256 = "sha256-Ez8d1tb0Xi91e3+U1/LDmj5u/oORQzelEQPFAC96yEI=";
}
