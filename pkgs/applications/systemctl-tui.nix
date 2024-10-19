{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "systemctl-tui";
  version = "unstable";

  src = fetchFromGitHub {
    name = "${pname}-${version}-source";
    owner = "rgwood";
    repo = pname;
    rev = "2f80971151ec19275260598f03d73142472235ee";
    hash = "sha256-mMyJqS7muuiF3LDHAdMtI1wtslQ2Yo9ldPj7K8UuDv8=";
  };

  cargoSha256 = "sha256-2KWKEdAw02itD8nJSQopbTJQj8O1lm7K3QScoD8Bhag=";
}
