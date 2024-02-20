{
  description = "Nixos config flake";

  #outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} {imports = [./flake];};

  inputs = {
    # flake-parts.url = "github:hercules-ci/flake-parts";
    # flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nur.url = "github:nix-community/NUR";
    # pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    anyrun.url = "github:Kirottu/anyrun";
    home-manager.url = "github:nix-community/home-manager";
    hyprland-contrib.url = "github:hyprwm/contrib";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim.url = "github:nix-community/nixvim";
    nix-gc-env.url = "github:Julow/nix-gc-env";

    # flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    # pre-commit-hooks.inputs.flake-utils.follows = "flake-utils";
    # pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland-contrib.inputs.nixpkgs.follows = "nixpkgs";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        # { nixpkgs.overlays = with inputs; [ nur.overlay ]; }
        # ({ pkgs, ... }:
        # let
        #   nur-no-pkgs = import nur {
        #     nurpkgs = import nixpkgs { system = "x86_64-linux"; };
        #   };
        # in {
        #   imports = [ nur-no-pkgs.repos.iopq.modules.xraya  ];
        #   services.xraya.enable = true;
        # })

        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
