{appimageTools, ...}:
appimageTools.wrapType2 rec {
  name = "yaak";
  version = "2024.3.8";

  src = builtins.fetchTarball {
    url = "https://releases.yaak.app/${version}/yaak_${version}_amd64.AppImage.tar.gz";
    sha256 = "0p09h8zw1d9bl8nzmsv7v868a13w6y2pi8wkf6rz2qlys03qcw04";
  };
}
