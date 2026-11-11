{ config, ... }:

let
  dotfiles =
    "${config.home.homeDirectory}/nix-config/dotfiles";

  link = path:
    config.lib.file.mkOutOfStoreSymlink
      "${dotfiles}/${path}";
in
{
  xdg.configFile = {
    "noctalia".source = link "noctalia";
    #"niri".source = link "niri";
    #"zed".source = link "zed";
    #"Code/User".source = link "Code/User";
  };
}
