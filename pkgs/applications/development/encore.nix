{
  fetchFromGitHub,
  buildGoModule,
  callPackage,
  makeWrapper,
  lib,
  ...
}:
buildGoModule rec {
  pname = "encore";
  version = "1.39.0";

  src = fetchFromGitHub {
    name = "encore-source";
    owner = "encoredev";
    repo = "encore";
    rev = "v${version}";
    hash = "sha256-71vzo52vV4VilBnLZxIWDKIY08rfTavMZ57qgi4pip8=";
  };

  doCheck = true;

  subPackages = [
    "cli/cmd/encore"
    "cli/cmd/git-remote-encore"
    "cli/cmd/tsbundler-encore"
  ];

  nativeBuildInputs = [makeWrapper];

  CGO_ENABLED = 1;

  postInstall = let
    tsparser = callPackage ./tsparser-encore.nix {};
    goEncore = callPackage ./go-encore.nix {};
  in ''
    mkdir -p $out/share/runtimes
    cp -r $src/runtimes/* $out/share/runtimes

    ln -s ${goEncore}/bin/* $out/bin
    ln -s ${tsparser}/bin/* $out/bin

    wrapProgram $out/bin/encore \
      --set ENCORE_RUNTIMES_PATH $out/share/runtimes \
      --set ENCORE_GOROOT ${goEncore}/share/go \
      --set GOROOT ${goEncore}/share/go
  '';

  vendorHash = "sha256-lM03+eBrny7uNKAq4xuQ3HSmX+aglaSEaRCetGgdyjQ=";
  proxyVendor = true;

  meta = with lib; {
    description = "Backend Development Platform to create event-driven and distributed systems";
    homepage = "https://encore.dev";
    license = licenses.mpl20;
    maintainers = with maintainers; [luisnquin];
    platforms = platforms.linux ++ platforms.darwin;
    mainProgram = "encore";
  };
}
