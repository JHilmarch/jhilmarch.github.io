{
  description = "Dev environment for Jekyll site using Nix flakes";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = [
      "x86_64-linux"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: let pkgs = import nixpkgs {inherit system;}; in f pkgs);
  in {
    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        # Core tools for Jekyll development
        buildInputs = [
          # Runtime & language toolchain
          pkgs.ruby
          pkgs.bundler
          pkgs.jekyll

          # Frontend tooling (optional but common)
          pkgs.nodejs_22

          # Native build tools often required by Ruby gems
          pkgs.gcc
          pkgs.gnumake
          pkgs.pkg-config

          # Common C libraries/headers needed by gems (e.g., ffi, openssl)
          pkgs.zlib
          pkgs.libffi
          pkgs.openssl
          pkgs.libyaml

          # Linting
          pkgs.alejandra
          pkgs.mdl
          pkgs.yamllint
          pkgs.lychee

          # Formatting
          pkgs.nodePackages.prettier
        ];

        shellHook = ''
          export JEKYLL_ENV=development
          # Keep gem installs local to the project
          export BUNDLE_PATH=.bundle
          export BUNDLE_BIN=.bundle/bin
          export PATH="$BUNDLE_BIN:$PATH"

          # Ensure Ruby/OpenSSL (and curl, git, etc.) know where to find CA certs
          export SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt
          export NIX_SSL_CERT_FILE=$SSL_CERT_FILE
          export CURL_CA_BUNDLE=$SSL_CERT_FILE
          export GIT_SSL_CAINFO=$SSL_CERT_FILE
          export RUBY_SSL_CERT_FILE=$SSL_CERT_FILE
          export BUNDLE_SSL_CA_CERT=$SSL_CERT_FILE

          echo "Jekyll dev shell activated"
          ruby --version || true
          bundler --version || true
          jekyll --version || true
          echo "GPG_TTY=$GPG_TTY"
          echo "SSL_CERT_FILE=$SSL_CERT_FILE"
          echo "CURL_CA_BUNDLE=$CURL_CA_BUNDLE"
          echo "GIT_SSL_CAINFO=$GIT_SSL_CAINFO"
        '';
      };
    });
  };
}
