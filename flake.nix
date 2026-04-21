{
	description = "Aron's NixOS config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		impermanence.url = "github:nix-community/impermanence";
	};

	outputs = { self, nixpkgs, home-manager, impermanence, ... }@inputs: {
		nixosConfigurations.hiroshima = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				impermanence.nixosModules.impermanence
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.extraSpecialArgs = { inherit inputs; };
					home-manager.users.aron = import ./home.nix;
				}
			];
		};
	};
}