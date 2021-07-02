https://haskell4nix.readthedocs.io/nixpkgs-users-guide.html

all haskell packages are in the attribute called `haskellPackages` in nixpkgs.

`nix-env -f "<nixpkgs>" -qaP --attr haskellPackages | wc`

haskellPackages with the `haskell-` prefix are packages that provide a library (+ optionally an executable) (like `haskell-pandoc`) whereas packages without that prefix provide just executables like `cabal-install`

For checking packages build with a particular compiler

`nix-env -f "<nixpkgs>" -qaP -A haskell.packages.ghc8104`

TThese are the compilers available : 

`nix-env -f "<nixpkgs>" -qaP -A haskell.compiler`

# GHCWithPackages

`nix-shell --pure -p ghc which haskellPackages.lens`

this doesnt work
doing `ghci` and `import Control.Lens` doesnt work because - 

GHC expects to find all installed libraries inside of its own lib directory. This approach works fine on traditional Unix systems, but it doesn’t work for Nix, because GHC’s store path is immutable once it’s built. We cannot install additional libraries into that location. As a consequence, our copies of GHC don’t know any packages except their own core libraries, like base, containers, Cabal, etc.

We can register additional libraries to GHC, however, using a special build function called ghcWithPackages. That function expects one argument: a function that maps from an attribute set of Haskell packages to a list of packages, which determines the libraries known to that particular version of GHC. For example, the Nix expression ghcWithPackages (pkgs: [pkgs.mtl]) generates a copy of GHC that has the mtl library registered in addition to its normal core packages

Alternative to ghcWithPackages is ghcWithHoogle which is essentially ghcWithPackagesAndHoogleAndDocumentationIndexes

# Adding language server

```
nix-shell --pure -p which haskell-language-server "haskellPackages.ghcWithPackages (pkgs: [pkgs.lens])"
```

cabal v2-configure --ghc-options=-haddock

creates 
