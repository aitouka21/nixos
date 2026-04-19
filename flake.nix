{
  description = "My NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      hh = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./hardwares/hh.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.malkuth = import ./homes/malkuth.nix;
	    # services.displayManager.defaultSession = "sway";
          }
        ];
      };
      ux303 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./hardwares/ux303.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.malkuth = import ./homes/malkuth.nix;
          }
        ];
      };
       yl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./hardwares/yl.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.malkuth = import ./homes/malkuth.nix;

	    networking = {
	      interfaces = {
	        enp42s0 = {
		  wakeOnLan.enable = true;
		};
	      };
	      firewall = {
	        allowedUDPPorts = [ 9 ];
	      };
	    };

	    services = {
	      displayManager.defaultSession = "sway";
	      sunshine = {
	        enable = true;
	        autoStart = true;
	        capSysAdmin = true;
	        openFirewall = true;
	      };
	    };
          }
        ];
      };
    };
  };
}
