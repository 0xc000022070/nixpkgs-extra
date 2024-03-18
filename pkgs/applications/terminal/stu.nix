{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "stu";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "lusingander";
    repo = "stu";
    rev = "b45af223371e54a81ea1b04f31c6545c5ca80f7d";
    hash = "sha256-32EwxLzZ9LVtNGAl5FyA2b5lEa10ebGzPNOJ/vK0Kr0=";
  };

  cargoSha256 = "sha256-SSdiy8iElwBJPrOHcFMfkVK7mqYPyKYkyRKLAVOSNr8=";
}
