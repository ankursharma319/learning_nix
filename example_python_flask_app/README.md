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
