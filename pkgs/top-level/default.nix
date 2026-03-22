{
  nixgrep,
  pkgs,
  lib ? pkgs.lib,
  ...
}:
with lib; let
  packages = {
    coders-crux = ../applications/coders-crux.nix;
    ecsview = ../applications/ecsview.nix;
    emoji-fzf = ../applications/emoji-fzf.nix;
    ght = ../applications/ght.nix;
    goweight = ../applications/goweight.nix;
    hyprdrop = ../applications/hyprdrop;
    mysqlweb = ../applications/mysqlweb.nix;
    no = ../applications/no.nix;
    npkill = ../applications/npkill.nix;
    s3-edit = ../applications/s3-edit.nix;
    vimix-cursor-theme = ../applications/vimix-cursor-theme.nix;
  };
in
  attrsets.mapAttrs (_name: p: pkgs.callPackage p {}) packages
  // {
    inherit (nixgrep.packages.${pkgs.stdenv.hostPlatform.system}) nixgrep;
  }
