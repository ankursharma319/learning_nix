# Nix Garbage collection - YT video

https://www.youtube.com/watch?v=ylZDUKU2eR0

To install packages globally for e.g.:
`nix-env --install --attr nixpkgs.ripgrep`

or from local derivation file
`nix-env --install --file ./whatever.nix

`nix-build '<nixpkgs>' --attr tree` to build tree but not symlink into user profile (so it doesnt count as "used" or "installed")

`nix-store --query --requisites /nix/store/66fbv9mmx1j4hrn9y06kcp73c3yb196r-python3-3.8.9/` to list requisites.

To run garbage collection :
`nix-collect-garbage`
