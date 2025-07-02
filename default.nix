{ nixpkgs }:

{
  hello =
    let pkgs = import nixpkgs {};
    in 
      pkgs.stdenv.mkDerivation {
        name = "hello-world";
        version = "1.0";
      
        unpackPhase = ":";
        src = null;
      
        buildPhase = ''
          mkdir -p $out/bin
          echo '#!/bin/sh' > $out/bin/hello-world
          echo 'echo "Hello, World!"' >> $out/bin/hello-world
          chmod +x $out/bin/hello-world
        '';
      }
}
