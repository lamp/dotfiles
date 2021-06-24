self: super: rec {
  clojure-lsp-bin = with super; stdenv.mkDerivation rec {
    name = "clojure-lsp-${version}";
    version = "2021.06.14-17.00.47";

    src = fetchzip {
      url = "https://github.com/clojure-lsp/clojure-lsp/releases/download/2021.06.14-17.00.47/clojure-lsp-native-macos-amd64.zip";
      sha256 = "foo";
      name = "clojure-lsp";
    };

    phases = ["installPhase"];

    installPhase = ''
      mkdir -p @out/bin
      cp -p $src/bb $out/bin/bb
    '';

    meta = with lib; {
      description = "A Language Server for Clojure. Taking a Cursive-like approach of statically analyzing code.";
      homepage = https://github.com/clojure-lsp/clojure-lsp;
      platforms = ["x86_64-darwin" ];

    };
  };
}
