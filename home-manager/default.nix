{ host, ... }:
{
  imports = [ ./modules ];
  home.username = host.username;
  home.homeDirectory = "/home/${host.username}";

  # This is a Home Manager compatibility setting; do not bump casually.
  # Set it when first adopting Home Manager.
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
