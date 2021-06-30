# Nix Profiles

`~/.nix-profile/` is a symlink to a profile in `/nix/var/nix/profiles/per-user/ankurs4/`, which also contains a history of profiles allowing for easy rollback and switch using `nix-env --rollback` and `nix-env --list-generations` and `nix-env --switch-generation 43`. Can also switch to an alternative profile using `nix-env --switch-profile /nix/var/nix/profiles/my-profile`

# Garbage collection

`nix-collect-garbage -d` where d option also deletes all old generations of all profiles.

To determine what can be deleted (is outside the dependency graph), the root of the garbage collector are all the store paths to which there is a symlink in `/nix/var/nix/gcroots`

# Sharing nix store

Possible to 
- import and export closures as .closure files
- serve a nix store as a cache similar to https://cache.nixos.org/ (via http or via ssh)

# Derivations

If want to contribute a package to the nixpkgs, then should add the derivation to the all-packages.nix in the clone of the nixpkgs and make a pull request.

If just want to have a package locally installed, recommended way is add it as an overlay (more info in nixpkgs manual)

If just want to have derivation for building/developing some local project but dont want to install it as package, just keep the derivation as a standalone file in your code and use `nix-build` (can also do `nix-env --install --file ./derivation.nix` if you do want to install it and have the binary added to the PATH but the main point is that the derivation doesnt need to be part of nixpkgs or overlays)

## derivation function

There must be an attribute named builder that identifies the program that is executed to perform the build. It can be either a derivation or a source (a local file reference, e.g., ./builder.sh). The default builder in mkDerivation has this content:

```
source $stdenv/setup
genericBuild
```

Every attribute in the derivation is passed as an environment variable to the builder. E.g. - `$name`, `$out`.
 - Strings and numbers are just passed verbatim.
 - true is passed as the string 1, false and null are passed as an empty string.
 - A path (e.g., ../foo/sources.tar) causes the referenced file to be copied to the store; its location in the store is put in the environment variable. The idea is that all sources should reside in the Nix store, since all inputs to a derivation should reside in the Nix store.
 - A derivation causes that derivation to be built prior to the present derivation; its default output path is put in the environment variable.
 - Lists are simply concatenated, separated by spaces.

# Verifying build reproducibility

https://nixos.org/manual/nix/unstable/advanced-topics/diff-hook.html
