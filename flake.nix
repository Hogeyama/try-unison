{
  description = "Try unison lang";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:numtide/devshell";
    unison.url = "github:ceedubs/unison-nix";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devshell.flakeModule ];
      systems = [ "x86_64-linux" ];
      perSystem = { config, lib, self', inputs', pkgs, system, ... }: {
        devshells.default = {
          devshell.motd = "";
          packages = [
            inputs.unison.packages.${system}.ucm
          ];
          commands = [
          ];
        };
      };
    };
}
