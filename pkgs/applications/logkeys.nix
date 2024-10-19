{
  fetchFromGitHub,
  autoconf,
  automake,
  stdenv,
  procps,
  which,
  lib,
  kbd,
}:
stdenv.mkDerivation {
  pname = "logkeys";
  version = "2018-01-22";

  src = fetchFromGitHub {
    owner = "kernc";
    repo = "logkeys";
    rev = "7a9f19fb6b152d9f00a0b3fe29ab266ff1f88129";
    sha256 = "1k6kj0913imwh53lh6hrhqmrpygqg2h462raafjsn7gbd3vkgx8n";
  };

  nativeBuildInputs = [autoconf automake];
  buildInputs = [which procps kbd];

  preConfigure = ''
    ./autogen.sh
  '';

  postPatch = ''
    substituteInPlace src/Makefile.am --replace 'root' '$(id -u)'
    substituteInPlace configure.ac --replace '/dev/input' '/tmp'
    sed -i '/chmod u+s/d' src/Makefile.am

    mkdir -p $out/etc/logkeys/keymaps
      cp $src/keymaps/es_ES.map $out/etc/logkeys/keymaps

    substituteInPlace scripts/logkeys-start.sh \
      --replace '--start' '--keymap ${placeholder "out"}/etc/logkeys/keymaps/es_ES.map --start'
  '';

  meta = with lib; {
    description = "A GNU/Linux keylogger that works!";
    license = licenses.gpl3;
    homepage = "https://github.com/kernc/logkeys";
    maintainers = with maintainers; [mikoim offline];
    platforms = platforms.linux;
  };
}
