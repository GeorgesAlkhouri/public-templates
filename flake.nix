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
        description = "A flake with python3.9 virtualenv, direnv and devenv.";
        welcomeText = ''
          # `.devenv` should be added to `.gitignore`
          ```sh
            echo .devenv >> .gitignore
          ```
        '';
      };

      python312 = {
        path = ./templates/python312;
        description = "A flake with python3.12 virtualenv, direnv and devenv.";
        welcomeText = ''
          # `.devenv` should be added to `.gitignore`
          ```sh
            echo .devenv >> .gitignore
          ```
        '';
      };
    in {
      inherit python39;
      default = python312;
    };
  };
}
