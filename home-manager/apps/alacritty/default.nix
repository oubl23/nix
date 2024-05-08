{ pkgs, lib, ... }:
let
  nixgl = import ../../nixgl.nix {inherit pkgs lib;};
  nixGLWrap = nixgl.wrap;
in
{
  programs = {
    alacritty = {
      enable = true;
      package = nixGLWrap pkgs.alacritty;
    };
  };
}
