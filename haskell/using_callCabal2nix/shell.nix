let
  myNixPkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/db6e089456cdddcd7e2c1d8dac37a505c797e8fa.tar.gz") {
    overlays = [myNixPkgsOverlay];
  };

  myNixPkgsOverlay = (nixSelf: nixSuper: {
    myHaskellPackages = nixSelf.haskellPackages.override (oldHaskellPkgs: {
      overrides = nixSelf.lib.composeExtensions (oldHaskellPkgs.overrides or (_: _: {}))  myHaskellPkgsOverlay;
    });
  });

  myHaskellPkgsOverlay = (hSelf: hSuper: {
    # "greeter" is the first part of the "greeter.cabal" project definition file
    greeter = hSelf.callCabal2nix "greeter" ./. {};
  });
  
  myDevTools = with myNixPkgs; [
    cabal-install 
    haskellPackages.ghcid
  ];

  myShellHook = ''
    alias repl="cabal new-repl"
  '';
in
myNixPkgs.myHaskellPackages.greeter.env.overrideAttrs (oldEnv: {
  nativeBuildInputs = oldEnv.nativeBuildInputs ++ myDevTools;
  shellHook = myShellHook;
})