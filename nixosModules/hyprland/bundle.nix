{ config, pkgs, ... }:
{
  imports = [
    ./cachix.nix
    ./hyprland.nix
  ];

  #Enable Hyprland cache
  my.enableCachix = true;
  my.enableHyprland = true;
}
