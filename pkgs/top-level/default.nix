{pkgs, ...}:
with pkgs.lib; let
  packages = {
    coders-crux = ../applications/coders-crux.nix;
    daktilo = ../applications/daktilo.nix;
    ecsview = ../applications/ecsview.nix;
    emoji-fzf = ../applications/emoji-fzf.nix;
    encore = ../applications/encore.nix;
    ght = ../applications/ght.nix;
    goweight = ../applications/goweight.nix;
    havn = ../applications/havn.nix;
    hyprdrop = ../applications/hyprdrop;
    kmon = ../applications/kmon.nix;
    logkeys = ../applications/logkeys.nix;
    minecraft-pumpkin = ../applications/minecraft-pumpkin;
    mysqlweb = ../applications/mysqlweb.nix;
    no = ../applications/no.nix;
    npkill = ../applications/npkill.nix;
    s3-edit = ../applications/s3-edit.nix;
    stu = ../applications/stu.nix;
    systemctl-tui = ../applications/systemctl-tui.nix;
    vimix-cursor-theme = ../applications/vimix-cursor-theme.nix;
  };
in
  attrsets.mapAttrs (_name: p: pkgs.callPackage p {}) packages
