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
    rev = "894c6099fca9c3b78fc198e5dba6b220de25aa57";
    hash = "sha256-uXfzeUPQk7qCopfoFmGdJ4z8WlmvPxVi7FO8MC3FgL4=";
  };

  cargoSha256 = "sha256-TZSdjmgNwLh0v8IJpxO3OPjgYVs4UbLX+3753mkPwTo=";
}
