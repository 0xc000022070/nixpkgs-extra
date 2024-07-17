{
  fetchFromGitHub,
  buildGoModule,
  ...
}:
buildGoModule rec {
  pname = "encore";
  version = "1.39.0";

  src = fetchFromGitHub {
    name = "${pname}-source";
    owner = "encoredev";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-71vzo52vV4VilBnLZxIWDKIY08rfTavMZ57qgi4pip8=";
  };

  CGO_ENABLED = 1;

  doCheck = true;

  subPackages = [
    "./cli/cmd/encore"
    "./cli/cmd/git-remote-encore"
    "./cli/cmd/tsbundler-encore"
  ];

  vendorHash = "sha256-lM03+eBrny7uNKAq4xuQ3HSmX+aglaSEaRCetGgdyjQ=";
  proxyVendor = true;
}
