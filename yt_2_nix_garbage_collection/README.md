# Nix Garbage collection - YT video

https://www.youtube.com/watch?v=ylZDUKU2eR0

To install packages globally for e.g.:
`nix-env --install --attr nixpkgs.ripgrep`

or from local derivation file
`nix-env --install --file ./whatever.nix

`nix-build '<nixpkgs>' --attr tree` to build tree but not symlink into user profile (so it doesnt count as "used" or "installed")

`nix-store --query --requisites /nix/store/66fbv9mmx1j4hrn9y06kcp73c3yb196r-python3-3.8.9/` to list requisites.

## Nix Profiles

Profile is a subset of stuff in nix store that is exposed on the PATH via `~/.nix-profile/bin(/lib/include)`.

`~/.nix-profile/` is a symlink to a profile in `/nix/var/nix/profiles/per-user/ankurs4/`, which also contains a history of profiles allowing for easy rollback and switch using `nix-env --rollback` and `nix-env --list-generations` and `nix-env --switch-generation 43`. Can also switch to an alternative profile using `nix-env --switch-profile /nix/var/nix/profiles/my-profile`

## Run garbage collection

`nix-collect-garbage`

`nix-collect-garbage -d` where d option also deletes all old generations of all profiles.

To determine what can be deleted (is outside the dependency graph), the root of the garbage collector are all the store paths to which there is a symlink in `/nix/var/nix/gcroots`
