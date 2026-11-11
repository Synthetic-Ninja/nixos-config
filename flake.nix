{
  description = "NixOS configuration: desktop (x86_64) and macbook (UTM ARM64)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-python37.url = "github:NixOS/nixpkgs/nixos-22.11";
    nixpkgs-python35.url = "github:NixOS/nixpkgs/nixos-20.03";

  };

  outputs = inputs@{ nixpkgs, home-manager, disko,  ... }:
    let
      lib = nixpkgs.lib;

      # Host-specific architecture, username and other metadata live in host.nix.
      hosts = {
        desktop = import ./hosts/hosts-configurations/desktop/host.nix;
        macbook = import ./hosts/hosts-configurations/macbook/host.nix;
      };

      makeSystem = hostname: host:
        lib.nixosSystem {
          system = host.system;

          specialArgs = {
            inherit inputs host;
            hostname = host.hostname or hostname;
          };

          modules = [
            ./hosts/hosts-configurations/${hostname}/configuration.nix
	    disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs host;
                  hostname = host.hostname or hostname;
                };
                users.${host.username} = {
		  imports = [
 		   ./home-manager
                   ./hosts/hosts-configurations/${hostname}/home-manager.nix
		  ];
		};
              };
            }
          ];
        };
    in {
      nixosConfigurations = lib.mapAttrs makeSystem hosts;
    
      devShells = import ./dev/shells.nix {
        inherit inputs;
        
        systems = lib.unique (
         builtins.map (host: host.system) (builtins.attrValues hosts)
        );

      };
    };
}
