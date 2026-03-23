{ nixpkgs }:

let
  pkgs = import nixpkgs {};
in
{
  timeout =
    pkgs.stdenv.mkDerivation {
      name = "hello-world-timeout";
      version = "1.9";
    
      unpackPhase = ":";
      src = null;
    
      buildPhase = ''
        mkdir -p $out/bin
        sleep 10
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
      name = "hello-world-null-timeout";
      version = "1.9";
    
      unpackPhase = ":";
      src = null;
    
      buildPhase = ''
        mkdir -p $out/bin
        sleep 10
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
      version = "1.9";
    
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
        name = "hello-world-remote-builder";
        version = "1.0";
      
        unpackPhase = ":";
        src = null;
      
        buildPhase = ''
          mkdir -p $out/bin
          echo "hi"
          echo '#!/bin/sh' > $out/bin/hello-world
          echo 'echo "Hello, World!' >> $out/bin/hello-world
          chmod +x $out/bin/hello-world
        '';

        meta = {
          requiredSystemFeatures = [ "remote-builder" ];
        };
      };

    runbuilder2 = 
      pkgs.stdenv.mkDerivation {
        name = "hello-world-remote-builder2";
        version = "1.0";
      
        unpackPhase = ":";
        src = null;
      
        buildPhase = ''
          mkdir -p $out/bin
          echo '#!/bin/sh' > $out/bin/hello-world
          echo 'echo "Hello, World!"' >> $out/bin/hello-world
          chmod +x $out/bin/hello-world
        '';

        requiredSystemFeatures = [ "remote-builder" ];
      };

    long-running = 
      pkgs.stdenv.mkDerivation {
        name = "long-running";
        version = "1.8";
      
        unpackPhase = ":";
        src = null;
      
        buildPhase = ''
          sleep 600
          touch $out
        '';
      };
}
