https://maybevoid.com/posts/2019-01-27-getting-started-haskell-nix.html

# Shell example

`nix-shell -p "haskellPackages.ghcWithPackages (pkgs: [pkgs.lens])"`

nix-shell --pure exampleShell.nix

will have ghci and cabal available in there

ghcWithPackages downloads the packages and adds the packages to GHC’s include path

# More complete example with cabal2nix

(This is very similar to the git_project0)

nix-shell --pure -p ghc cabal-install --run "cabal init"

nix-shell --pure -p cabal2nix --run "cabal2nix ." > exampleDerivation.nix

nix-build release.nix --no-out-link

The executableHaskellDepends is coming from the pkgs.haskellPackages (same thing used in exampleShell.nix)

This derivation doesnt have cabal so use properShell.nix for that,

nix-shell --pure properShell.nix

In order to create a shell with our project built and installed in :

nix-shell --pure external.nix
maybeVoid


