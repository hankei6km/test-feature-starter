with import <nixpkgs> { };

let
  personal = import (builtins.fetchTarball {
    url =
      "https://github.com/hankei6km/test-nix-channel-simple/archive/v0.2.0.tar.gz";
    sha256 = "00zgdi8hd1jcx9q96rv07l189g0hkrrcvqwkj1ggf32fp1dxxbzy";
  });
  csb = stdenv.mkDerivation {
    name = "csb";
    buildInputs = [
      # ここでインストールしても拡張機能からは認識されない.
      # shellcheck を Bash IDE から利用する場合は手動インストール後に reload が必要.
      # shellcheck
      personal.fakePodmanDocker
    ];
  };
in
csb
