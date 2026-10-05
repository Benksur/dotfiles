.PHONY: switch build update clean

switch:
	home-manager switch --flake .#benksur

build:
	home-manager build --flake .#benksur

update:
	nix flake update

clean:
	nix store gc
