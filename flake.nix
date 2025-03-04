{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.sobremesa = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };
        modules = [
          ./hosts/sobremesa/configuration.nix
        ];

      };
      
      nixosConfigurations.portatil = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };
        modules = [
          ./hosts/portatil/configuration.nix
        ];

      };

      homeConfigurations = {
      # Configuración para el portatil
      portatil = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs system; };
        modules = [
          ./hosts/portatil/home.nix  # Ruta de configuración para el portatil
          ./homeManagerModules/default.nix  # Módulos adicionales si los tienes
        ];
      };

      # Configuración para la sobremesa
      sobremesa = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs system; };
        modules = [
          ./hosts/sobremesa/home.nix  # Ruta de configuración para la sobremesa
          ./homeManagerModules/default.nix  # Módulos adicionales si los tienes
        ];
      };
    };
  };
}
