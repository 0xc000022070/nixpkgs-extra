{
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  pname = "s3-edit";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "luisnquin";
    repo = pname;
    rev = "57e60f84ef5a138a9fbc7f4eb6d220ba6fd06976";
    hash = "sha256-TGpIP32k9ryAz4njT4qcd8RuLOeaNlGZM2jEkFET7kg=";
  };

  ldflags = ["-X main.version=${version}"];

  vendorHash = "sha256-93KrzlXmhxjfinZA1J1tRF1F5PW0JqIq8HvElkcfB3g=";
}
