self: super: rec {
  babashka-bin = with super; stdenv.mkDerivation rec {
    name = "babashka-${version}";
    version = "0.4.6";

    src = fetchzip {
      url = "https://github.com/babashka/babashka/releases/download/v0.4.6/babashka-0.4.6-macos-amd64.tar.gz";
      sha256 = "075v0vgnifjz4073r5hvky33bqm3acycvmqbi1lfbbph2glsi1nc";
      name = "babashka";
    };

    phases = [ "installPhase" ];

    installPhase = ''
      mkdir -p $out/bin
      cp -p $src/bb $out/bin/bb
    '';

    meta = with lib; {
      description = "Native, fast starting Clojure interpreter for scripting";
      homepage = https://github.com/babashka/babashka;
      platforms = [ "x86_64-darwin" ];
    };
  };
}
