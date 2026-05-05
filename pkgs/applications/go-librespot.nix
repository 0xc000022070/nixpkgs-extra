{
  lib,
  fetchFromGitHub,
  pkg-config,
  alsa-lib,
  libvorbis,
  libogg,
  flac,
  buildGoModule,
}:
buildGoModule {
  pname = "go-librespot";
  version = "unstable-2026-05-05";

  src = fetchFromGitHub {
    owner = "devgianlu";
    repo = "go-librespot";
    rev = "046cb360cc4cb1651f09bc2f91217d68fb023bf1";
    hash = "sha256-/WmE6+1ArHmCT1+5+oAC2Vut8JA3zi/mMmp2fGaB7wM=";
  };

  vendorHash = "sha256-kCzzybOEP4Tp7OGFZBjIP1FgcQ9u+lgO3931gbaG9hA=";

  nativeBuildInputs = [pkg-config];
  buildInputs = [
    alsa-lib
    libvorbis
    libogg
    flac
  ];

  subPackages = ["cmd/daemon"];

  postInstall = ''
    mv $out/bin/daemon $out/bin/go-librespot
  '';

  meta = with lib; {
    description = "Open source client library for Spotify";
    homepage = "https://github.com/devgianlu/go-librespot";
    license = licenses.gpl3Only;
    maintainers = [];
  };
}
