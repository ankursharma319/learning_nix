{ nixpkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/db6e089456cdddcd7e2c1d8dac37a505c797e8fa.tar.gz") {} }:
let
  inherit (nixpkgs) pkgs;

  haskellPackages = pkgs.haskellPackages.override {
    overrides = self: super: {
      haskell-nix-demo = self.callPackage ./exampleDerivation.nix {};
    };
  };

  haskellDeps = ps: with ps; [
    base
    haskell-nix-demo
  ];

  ghc = haskellPackages.ghcWithPackages haskellDeps;

  nixPackages = [
    ghc
    haskellPackages.haskell-nix-demo
    haskellPackages.cabal-install
  ];
in
pkgs.stdenv.mkDerivation {
  name = "env";
  buildInputs = nixPackages;
}