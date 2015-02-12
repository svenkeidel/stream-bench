{ pkgs ? import <nixpkgs> {} }:

with pkgs.haskellPackages; cabal.mkDerivation (self: {
  pname = "stream-bench";
  version = "0.1.0.0";
  src = ./.;
  buildDepends = [
    cabalInstall criterion Stream arrows
  ];
  meta = {
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
