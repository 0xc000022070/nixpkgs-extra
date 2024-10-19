{
  fetchFromGitHub,
  libpulseaudio,
  rustPlatform,
  pkg-config,
  alsa-lib,
  xorg,
}:
rustPlatform.buildRustPackage rec {
  pname = "daktilo";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = "daktilo";
    rev = "v${version}";
    hash = "sha256-gIBWonJGX6IpxyBeMulcfQEExsG1GrBVQLZbBBA1ruc=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    xorg.libX11.dev
    xorg.libXi.dev
    libpulseaudio
    xorg.libXtst
    alsa-lib
  ];

  cargoSha256 = "sha256-lBlzXTkhsEboTby5tH7WfsvZxUwtw7sLYVJRozjI1D4=";
}
