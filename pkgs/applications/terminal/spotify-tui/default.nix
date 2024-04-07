{
  installShellFiles,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
  python3,
  stdenv,
  libxcb,
  lib,
}:
rustPlatform.buildRustPackage rec {
  pname = "spotify-tui";
  version = "unstable";

  src = fetchFromGitHub {
    name = "${pname}-${version}-source";
    owner = "Rigellute";
    repo = "spotify-tui";
    rev = "c4dcf6b9fd8318017acbdd7ec005955e26cf2794";
    hash = "sha256-Zm3dTMWu61Z7v8z8DZGmzjBWSFy+y3J90+nu9zYLFUg=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  nativeBuildInputs = [installShellFiles] ++ lib.optionals stdenv.isLinux [pkg-config python3];
  buildInputs =
    []
    ++ lib.optionals stdenv.isLinux [openssl libxcb];

  postPatch = ''
    # update Cargo.lock to fix build
    ln -sf ${./Cargo.lock} Cargo.lock

    # Add patch adding the collection variant to rspotify used by spotify-tu
    # This fixes the issue of getting an error when playing liked songs
    # see https://github.com/NixOS/nixpkgs/pull/170915
    patch -p1 -d $cargoDepsCopy/rspotify-0.10.0 < ${./0001-Add-Collection-SearchType.patch}
  '';

  postInstall = ''
    for shell in bash fish zsh; do
      $out/bin/spt --completions $shell > spt.$shell
      installShellCompletion spt.$shell
    done
  '';

  meta = with lib; {
    description = "Spotify for the terminal written in Rust";
    homepage = "https://github.com/Rigellute/spotify-tui";
    changelog = "https://github.com/Rigellute/spotify-tui/blob/v${version}/CHANGELOG.md";
    license = with licenses; [
      mit
      /*
      or
      */
      asl20
    ];
    mainProgram = "spt";
  };
}
