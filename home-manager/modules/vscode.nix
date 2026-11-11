{ pkgs, config, ... }:

let
  dotfiles =
    "${config.home.homeDirectory}/nixos-config/dotfiles/vscode";

  link = path:
    config.lib.file.mkOutOfStoreSymlink
      "${dotfiles}/${path}";
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    mutableExtensionsDir = true;
  };

  xdg.configFile = {
    "Code/User/settings.json".source =
      link "settings.json";

    "Code/User/keybindings.json".source =
      link "keybindings.json";
  };
}
