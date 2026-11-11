{ inputs, pkgs, ... }:

{ 

  imports = [
   inputs.niri.homeModules.config

   ./inputs.nix
   ./binds.nix
   ./layout.nix
   ./animation.nix

  ];

  programs.niri.package = pkgs.niri;
  
  programs.niri.settings = {
   prefer-no-csd = true;
  };

}
