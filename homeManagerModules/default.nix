{ config, pkgs, ... }:
{
  imports = [
    ./hyprland/hyprland.nix
    ./tools/zsh.nix
  ];
}
