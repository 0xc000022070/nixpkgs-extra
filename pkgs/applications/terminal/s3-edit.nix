{
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  pname = "s3-edit";
  version = "unmantained";

  src = fetchFromGitHub {
    owner = "tsub";
    repo = pname;
    rev = "9196f7f29073f57caaee79f08fad9b1a86cc6b71";
    hash = "sha256-BNFbg3IRsLOdakh8d53P0FSOGaGXYJuexECPlCMWCC0=";
  };

  ldflags = ["-X main.version=${version}"];

  vendorHash = "sha256-ZM5Z3yLOwOYpOTyoXmSbyPFBE31F+Jvc6DN4rmHmyt0=";
}
