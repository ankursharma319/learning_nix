Make sure nix and direnv are installe

Then cd into this directory and the environment should be setup. 


https://lambdablob.com/posts/nix-haskell-programming-environment/#shell-nix-bootstrap-file


Should just be able to run `cabal --enable-nix build` in the shell.
And can verify that nothing is added to `~/.cabal/store/`.


https://bytes.zone/posts/callcabal2nix/

(see alternate1.nix and alternate2.nix - `nix-build alternate1.nix`)

