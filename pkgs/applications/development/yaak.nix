{appimageTools, ...}:
appimageTools.wrapType2 rec {
  name = "yaak";
  version = "2024.3.8";

  src = builtins.fetchTarball {
    url = "https://releases.yaak.app/${version}/yaak_${version}_amd64.AppImage.tar.gz";
    sha256 = "0rg0zbmc51y7qyl765mqxa5aqdzwy85i22604mryd5kwsa13cnd4";
  };
}
