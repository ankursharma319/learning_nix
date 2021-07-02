{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/db6e089456cdddcd7e2c1d8dac37a505c797e8fa.tar.gz") { }, ... }:
pkgs.mkShell {
  inputsFrom = [ (pkgs.haskellPackages.callCabal2nix "greeter" ./. { }).env ];
}