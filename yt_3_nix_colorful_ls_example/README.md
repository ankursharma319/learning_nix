# Using Nix to prettify `ls` output on macOS

https://www.youtube.com/watch?v=1nU_hR2kod4

Can install gnu coreutils and that will give the colorful ls.

`nix-env --install --attr nixpkgs.coreutils`

The problem is it also installs a lot of other gnu-coreutils binaries into `~/.nix-profile/bin/` like cat, rm etc.

We will try to install only the relevant `ls` command and use it learn a bit more about `pkgs.runCommand` which is a wrapper on `stdenv.mkDerivation`

https://nixos.org/manual/nixpkgs/unstable/#trivial-builder-runCommand

`pkgs.runCommand` takes 3 args, the name of the package in nix store, environment variables set, and the buildCommand.

In order to be registered as successful, the buildCommand must create the `$out` directory (which is essentially the output path in nix store).

In the buildCommand, we shouldnt copy arbitary files from the machine, but instead try to use fetchurl or fetchgit to get files because that requires sha256 of the file to be specified and will give build error if the content of file changes.
