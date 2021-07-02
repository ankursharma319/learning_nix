https://github.com/Gabriel439/haskell-nix/tree/master/project0

nix-build --no-out-link release0.nix
nix-shell --attr env release0.nix

Normally nix-shell wouldn't require the --attr flag since nix-shell is designed to automatically compute the necessary development environment from the original derivation. However, Haskell derivations are different and nix-shell doesn't work out of the box on them.

Haskell derivations are records that include an env field which nix-shell can use to compute the correct development environment.


nix-prefetch-git https://github.com/NixOS/nixpkgs.git 2c288548b93b657365c27a0132a43ba0080870cc > nixpkgs.json


project0.nix file was generated using cabal2nix by running:

cabal2nix . > project0.nix

Any time you update a Haskell project's cabal file you need to regenerate the project0.nix file using cabal2nix