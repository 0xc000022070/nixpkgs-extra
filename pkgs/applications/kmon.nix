{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "kmon";
  version = "1.6.5";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-1OsQT3RMNLQMjr4aA2u5knp/HhOUOJ/oZYHG/+cTQFQ=";
  };

  doCheck = false;

  cargoSha256 = "sha256-9xRlm5pWWRRPq6MMwiMADmm8Bg2FqKNSfv7tm1ONiiQ=";
}
