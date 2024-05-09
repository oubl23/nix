{
  description = "My Ubuntu Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
    hyprland = {
      url = "github:hyprwm/Hyprland?ref=v0.40.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hycov = {
      url = "github:DreamMaoMao/hycov";
      inputs.hyprland.follows = "hyprland";
    };
    hypreasymotion = {
      url = "github:DreamMaoMao/hyprland-easymotion";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hypr-contrib.url = "github:hyprwm/contrib";
  };
  outputs =
    inputs@{ nixgl
    , nixpkgs
    , home-manager
    , ...
    }:
    let
      system = "x86_64-linux";
      overlays = [ nixgl.overlays ];
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations = {
        dabao = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
          ];
          extraSpecialArgs = {
            inherit inputs;
          };
        };
      };
    };
}
