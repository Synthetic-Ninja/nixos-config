{ pkgs, config, ... }:

let
  dotfiles =
    "${config.home.homeDirectory}/nixos-config/dotfiles/zed-editor";

  link = path:
    config.lib.file.mkOutOfStoreSymlink
      "${dotfiles}/${path}";
in
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
  };

  xdg.configFile = {
    "zed/settings.json".source =
      link "settings.json";

    "zed/keymap.json".source =
      link "keymap.json";

    "zed/themes".source =
      link "themes";
  };
}
