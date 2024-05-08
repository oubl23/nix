{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./fonts.nix
    ./apps
    # ./wm/hyprland
  ];
  home.username = "dabao";
  home.homeDirectory = "/home/dabao";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.nixpkgs-fmt
  ];

}
