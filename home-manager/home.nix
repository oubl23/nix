{ config, pkgs, lib, inputs, ... }:
let nixGL = import <nixgl> { };
in
{
  imports = [
    ./fonts.nix
    ./apps
    # ./wm/hyprland
    ./wm/hyprland/config.nix
    ./wall
  ];
  home = {
    username = "dabao";
    homeDirectory = "/home/dabao";
    stateVersion = "23.11";

    sessionVariables = {
      QT_SCALE_FACTOR = "1";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      CLUTTER_BACKEND = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };
  };


  programs.home-manager.enable = true;
  home.packages = [
    nixGL.auto.nixGLDefault
  ] ++ (with pkgs; [ nixpkgs-fmt swaylock-effects swayidle pamixer grimblast hyprpicker  ]);


  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = [
      # inputs.hycov.packages.${pkgs.system}.hycov
      # inputs.hypreasymotion.packages.${pkgs.system}.hypreasymotion
    ];
    systemd.enable = true;
  };


}
