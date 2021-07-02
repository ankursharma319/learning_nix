let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e85975942742a3728226ac22a3415f2355bfc897.tar.gz") {};
in
  pkgs.haskellPackages.callPackage ./project0.nix { }
