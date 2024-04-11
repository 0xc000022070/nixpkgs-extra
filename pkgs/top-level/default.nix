{pkgs, ...}:
with pkgs.lib; let
  packages = {
    coders-crux = ../applications/fonts/coders-crux.nix;
    ecsview = ../applications/terminal/ecsview.nix;
    daktilo = ../applications/terminal/daktilo.nix;
    emoji-fzf = ../applications/terminal/emoji-fzf.nix;
    ght = ../applications/terminal/ght.nix;
    havn = ../applications/terminal/havn.nix;
    lazysql = ../applications/terminal/lazysql.nix;
    netscanner = ../applications/terminal/netscanner.nix;
    mysqlweb = ../applications/terminal/mysqlweb.nix;
    no = ../applications/terminal/no.nix;
    npkill = ../applications/terminal/npkill.nix;
    openapi-tui = ../applications/terminal/openapi-tui.nix;
    stu = ../applications/terminal/stu.nix;
    vimix-cursor-theme = ../applications/desktop/vimix-cursor-theme.nix;
    yaak = ../applications/development/yaak.nix;
    passgen = ../applications/terminal/passgen.nix;
    logkeys = ../applications/terminal/logkeys.nix;
    # pg-ping = ./pg-ping.nix;
    # dbeaver = ./dbeaver.nix;
    # netflix = ./netflix.nix;
    # tpm = ./tpm.nix;
  };
in
  attrsets.mapAttrs (_name: p: pkgs.callPackage p {}) packages
