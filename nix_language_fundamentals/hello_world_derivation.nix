{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e85975942742a3728226ac22a3415f2355bfc897.tar.gz") {}
}:

pkgs.stdenv.mkDerivation rec {
    pname = "hello";
    version = "2.10";
    doCheck = true;
    src = pkgs.fetchurl {
        url = "mirror://gnu/hello/${pname}-${version}.tar.gz";
        sha256 = "0ssi1wpaf7plaswqqjwigppsg5fyh99vdlb9kzl7c9lng89ndq1i";
    };
}
