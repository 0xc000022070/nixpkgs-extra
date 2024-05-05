{
  fetchFromGitHub,
  buildGoModule,
  ...
}:
buildGoModule rec {
  pname = "goweight";
  version = "unstable";
  src = fetchFromGitHub {
    name = "${pname}-source";
    owner = "jondot";
    repo = pname;
    rev = "624b44a7a73a54fe24a2061cca7030ff8855d488";
    hash = "sha256-pw/4QvcPxdpylH0H7JxPzP7I3tC7hxSJZ0cDTY0WRb8=";
  };

  vendorHash = "sha256-sVaIGHtvyb8B+2vcpO4B1fX6jpQp1dGeWqz8bH3EuEk=";
  doCheck = true;
}
