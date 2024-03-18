{pkgs ? import <nixpkgs> {}, ...}:
with pkgs.lib; let
  packages = {
    coders-crux = ./fonts/coders-crux.nix;
    ecsview = ./terminal/ecsview.nix;
    emoji-fzf = ./terminal/emoji-fzf.nix;
    ght = ./terminal/ght.nix;
    lazysql = ./terminal/lazysql.nix;
    netscanner = ./terminal/netscanner.nix;
    no = ./terminal/no.nix;
    npkill = ./terminal/npkill.nix;
    openapi-tui = ./terminal/openapi-tui.nix;
    stu = ./terminal/stu.nix;
    vimix-cursor-theme = ./desktop/vimix-cursor-theme.nix;
    yaak = ./development/yaak.nix;
    # pg-ping = ./pg-ping.nix;
    # dbeaver = ./dbeaver.nix;
    # netflix = ./netflix.nix;
    # tpm = ./tpm.nix;
  };
in
  attrsets.mapAttrs (_name: p: pkgs.callPackage p {}) packages
