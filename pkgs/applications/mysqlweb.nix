{
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  pname = "mysqlweb";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "luisnquin";
    repo = pname;
    rev = "0a85d533da672382a5438a1d29abd8cd556e9505";
    hash = "sha256-7icbvY6GR08CUvFdOlft5qgyZdH/lPa04S+XhY815Zo=";
  };

  ldflags = ["-X main.version=${version}"];
  buildTarget = ".";

  vendorHash = "sha256-pSY/YvEXMWMAC63I5J/TToIwyWUhtJNY3pN4XxZaW2M=";
  doCheck = true;
}
