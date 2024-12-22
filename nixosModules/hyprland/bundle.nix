{ config, pkgs, ... }:
{
  imports = [
    ./cachix.nix
  ];

  #Enable Hyprland cache
  my.enableCachix = true;
  my.enableHyprland = true;
}
