{
  config,
  pkgs,
  lib,
  ...
}:

let
  enableRust = config.my.enableRust or false;
in
{
  options.my.enableRust = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable rust in the system";
  };

  config = lib.mkIf enableRust {
    environment.systemPackages = with pkgs; [
      cargo
      rustc
      rustup
      gcc
      cargo-generate
      rust-analyzer
      bacon
    ];
  };
}
