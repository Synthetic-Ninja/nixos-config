{ inputs, config, ... }:

let
 dotfiles = "${config.home.homeDirectory}/nixos-config/dotfiles";
 link = path: 
   config.lib.file.mkOutOfStoreSymlink
    "${dotfiles}/${path}";
in

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  xdg.stateFile."noctalia/settings.toml".source = link "noctalia/settings.toml";

  xdg.configFile."noctalia".source = link "noctalia/config";
}
