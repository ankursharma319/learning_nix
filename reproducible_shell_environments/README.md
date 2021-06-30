Run `nix-shell`


Besides activating the environment for each project, every time you change shell.nix you need to re-enter the shell.

You can use direnv to automate this process for you, with the downside that each developer needs to install it globally.

To install a nix package for global use

`nix-env -iA nixpkgs.direnv`

the globally installed packages have binaries,libs,headers etc. downloaded in /nix/store as well but symlinks are also created in ~/.nix-profile/bin which is made available on user PATH.

