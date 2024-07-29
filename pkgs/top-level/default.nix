{pkgs, ...}:
with pkgs.lib; let
  packages = {
    atac = ../applications/terminal/atac.nix;
    coders-crux = ../applications/fonts/coders-crux.nix;
    ecsview = ../applications/terminal/ecsview.nix;
    daktilo = ../applications/terminal/daktilo.nix;
    emoji-fzf = ../applications/terminal/emoji-fzf.nix;
    encore = ../applications/development/encore.nix;
    go-encore = ../applications/development/go-encore.nix;
    ght = ../applications/terminal/ght.nix;
    go-blueprint = ../applications/terminal/go-blueprint.nix;
    goweight = ../applications/terminal/goweight.nix;
    havn = ../applications/terminal/havn.nix;
    kmon = ../applications/terminal/kmon.nix;
    lazysql = ../applications/terminal/lazysql.nix;
    netscanner = ../applications/terminal/netscanner.nix;
    mysqlweb = ../applications/terminal/mysqlweb.nix;
    no = ../applications/terminal/no.nix;
    npkill = ../applications/terminal/npkill.nix;
    openapi-tui = ../applications/terminal/openapi-tui.nix;
    s3-edit = ../applications/terminal/s3-edit.nix;
    stu = ../applications/terminal/stu.nix;
    vimix-cursor-theme = ../applications/desktop/vimix-cursor-theme.nix;
    yaak = ../applications/development/yaak.nix;
    logkeys = ../applications/terminal/logkeys.nix;
    systemctl-tui = ../applications/terminal/systemctl-tui.nix;
  };
in
  attrsets.mapAttrs (_name: p: pkgs.callPackage p {}) packages
