{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    templates = let
      python39 = {
        path = ./templates/python39;
        description = "A flake with python39 virtualenv, direnv and devenv.";
        welcomeText = ''
          # `.devenv` should be added to `.gitignore`
          ```sh
            echo .devenv >> .gitignore
          ```
        '';
      };
    in {
      inherit python39;
      default = python39;
    };
  };
}
