{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "stu";
  version = "unstable";

  src = fetchFromGitHub {
    name = "${pname}-${version}-source";
    owner = "lusingander";
    repo = pname;
    rev = "281937e7d85c9e5b104c6bd66a9532007864c90b";
    hash = "sha256-9FDILkGl7glFnZCoqW0X933krTo752Ky5Zpm1+RGyAM=";
  };

  cargoSha256 = "sha256-Ep7n+PWpPiXZL+bCZMNk93KgU6TM32Pb8zcP6Qb62Mc=";
}
