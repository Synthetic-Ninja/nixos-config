{ pkgs, ... }:
{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
      vim
      wget
      curl
      git
  ];

}
