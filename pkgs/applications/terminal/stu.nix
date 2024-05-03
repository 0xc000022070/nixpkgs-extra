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
    rev = "da06abfacd0257e2d2ef985ed3243a09af4277a6";
    hash = "sha256-gVYtho2rXc0ODP7S5yrK1XAYbbm6ZGArLIO0Y1eG91A=";
  };

  cargoSha256 = "sha256-J8TjPF/iHfc8q+Pui5t36X9S/f4LQwsXpg+RPW+P02I=";
}
