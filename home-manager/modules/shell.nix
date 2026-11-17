{ lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    initContent = lib.mkAfter ''
      eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
    '';
  };
}
