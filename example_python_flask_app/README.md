# Nix

https://nixos.org/guides/dev-environment.html


To download dependencies to `/nix/store/` and also add `myapp` to `/nix/store/`

This will create a symbolic link `./result` to our package’s path in the Nix store, which looks like `/nix/store/6i4l781jwk5vbia8as32637207kgkllj-myapp-0.1`

```bash
nix-build
```

Can also do something like this
```bash
nix-shell default.nix
python3 myapp.py
```

## Ad hoc environment

nix-shell -p gitMinimal vim nano joe

nix-shell -p 'python38.withPackages (packages: [ packages.django ])'

-p is for nix packages

To list available packages with name git for e.g.
nix-env -qaP git
nix-env --query --attr-path --available git

### A fully pure (reproducible by others on other machines) environment

nix-shell --pure -p git -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/82b5f87fcc710a99c47c5ffe441589807a8202af.tar.gz