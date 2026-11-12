# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, username, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./disko.nix
    ./host-configuration
    ../../hosts-common-modules/nixos
  ];
  
  system.stateVersion = "26.05"; # Did you read the comment?

  nix.settings = {
    #max-jobs = 1;
    #cores = 1;

    experimental-features = [
      "nix-command"
      "flakes"
    ];

  };
  
  services.spice-vdagentd.enable = true;

 
}
