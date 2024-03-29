Run `nix-shell`


Besides activating the environment for each project, every time you change shell.nix you need to re-enter the shell.

You can use direnv to automate this process for you, with the downside that each developer needs to install it globally.

To install a nix package for global use

`nix-env -iA nixpkgs.direnv`

the globally installed packages have binaries,libs,headers etc. downloaded in /nix/store as well but symlinks are also created in ~/.nix-profile/bin which is made available on user PATH.

## Ad hoc environment

nix-shell -p gitMinimal vim nano joe

nix-shell -p 'python38.withPackages (packages: [ packages.django ])'

-p is for nix packages

To list available packages with name git for e.g.
nix-env -qaP git
nix-env --query --attr-path --available git

### A fully pure (reproducible by others on other machines) environment

nix-shell --pure -p git -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/82b5f87fcc710a99c47c5ffe441589807a8202af.tar.gz

### new nix commands

`nix develop` replaces the `nix-shell shell.nix` and is meant to be used for dev environments.
`nix shell` replaces `nix-shell -p gitMinimal` type commands which are used to provision software temporarily.

