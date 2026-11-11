{ inputs, systems }:

let
  lib = inputs.nixpkgs.lib;

  mkPythonShell = system: nixpkgsInput: pythonAttr:
    let
      pkgs = import nixpkgsInput {
        inherit system;
      };
    in
    pkgs.mkShell {
      buildInputs = [
        pkgs.${pythonAttr}
      ];

      nativeBuildInputs = [
        pkgs.pkg-config
      ];

      shellHook = ''
        if [ -f .venv/bin/activate ]; then
          source .venv/bin/activate
        fi
      '';
    };
in
lib.genAttrs systems (system: {
  python35 =
    mkPythonShell system inputs.nixpkgs-python35 "python35";

  python37 =
    mkPythonShell system inputs.nixpkgs-python37 "python37";
})
