{
  description = "Nixos config flake";

  #outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} {imports = [./flake];};

  inputs = {
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aylur-dotfiles = {
      url = "github:aylur/dotfiles";
      flake = false;
    };

    matugen.url = "github:InioX/matugen";

    anyrun.url = "github:Kirottu/anyrun";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nur.url = "github:nix-community/NUR";
    home-manager.url = "github:nix-community/home-manager";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib.url = "github:hyprwm/contrib";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    nixvim.url = "github:nix-community/nixvim";
    nix-gc-env.url = "github:Julow/nix-gc-env";

    anyrun.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland-contrib.inputs.nixpkgs.follows = "nixpkgs";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";

    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    # nur,
    # hyprland,
    ...
  }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        home-manager.nixosModules.default
      ];
    };
  };
}
