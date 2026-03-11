{ nixpkgs }:

let
  pkgs = import nixpkgs {};
in
{
  timeout =
    pkgs.stdenv.mkDerivation {
      name = "hello-world";
      version = "1.0";
    
      unpackPhase = ":";
      src = null;
    
      buildPhase = ''
        mkdir -p $out/bin
        sleep 20
        echo '#!/bin/sh' > $out/bin/hello-world
        echo 'echo "Hello, World with timer!"' >> $out/bin/hello-world
        chmod +x $out/bin/hello-world
      '';

      meta = {
        timeout = 5;
      };
    };

  nulltimeout =
    pkgs.stdenv.mkDerivation {
      name = "hello-world";
      version = "1.0";
    
      unpackPhase = ":";
      src = null;
    
      buildPhase = ''
        mkdir -p $out/bin
        sleep 20
        echo '#!/bin/sh' > $out/bin/hello-world
        echo 'echo "Hello, World with timer!"' >> $out/bin/hello-world
        chmod +x $out/bin/hello-world
      '';

      meta = {
        timeout = -1;
      };
    };

  hello =
    pkgs.stdenv.mkDerivation {
      name = "hello-world";
      version = "1.0";
    
      unpackPhase = ":";
      src = null;
    
      buildPhase = ''
        mkdir -p $out/bin
        sleep 10
        echo '#!/bin/sh' > $out/bin/hello-world
        echo 'echo "Hello, World"' >> $out/bin/hello-world
        chmod +x $out/bin/hello-world
      '';

    };

    runlocally = 
      pkgs.stdenv.mkDerivation {
        name = "hello-world-local";
        version = "1.0";
      
        unpackPhase = ":";
        src = null;
      
        buildPhase = ''
          mkdir -p $out/bin
          echo '#!/bin/sh' > $out/bin/hello-world
          echo 'echo "Hello, World"' >> $out/bin/hello-world
          chmod +x $out/bin/hello-world
        '';

        meta = {
          requiredSystemFeatures = [ "local" ];
        };
  
      };

    runbuilder = 
      pkgs.stdenv.mkDerivation {
        name = "hello-world-builder";
        version = "1.0";
      
        unpackPhase = ":";
        src = null;
      
        buildPhase = ''
          mkdir -p $out/bin
          echo '#!/bin/sh' > $out/bin/hello-world
          echo 'echo "Hello, World"' >> $out/bin/hello-world
          chmod +x $out/bin/hello-world
        '';

        meta = {
          requiredSystemFeatures = [ "slan" ];
        };
  
      };
}
