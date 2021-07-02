{ nixpkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/db6e089456cdddcd7e2c1d8dac37a505c797e8fa.tar.gz") {}
, compiler ? "ghc8104"
}:

let
  inherit (nixpkgs) pkgs;
  myGhcWithPackages = pkgs.haskell.packages.${compiler}.ghcWithPackages (ps: with ps; [
          monad-par
          mtl
          lens
        ]);
in
pkgs.stdenv.mkDerivation {
  name = "my-haskell-env-0";
  buildInputs = [
    myGhcWithPackages
    pkgs.which
    pkgs.cabal-install
    pkgs.ghcid
  ];
  shellHook = ''
  echo "executing my shell hook"
  export CABAL_DIR="$PWD/tmp_cabal_dir/"
  export CABAL_CONFIG="$CABAL_DIR/config"
  '';
}
