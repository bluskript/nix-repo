{ lib, rustPlatform, fetchFromGitHub, openssl, pkg-config, perl }: rustPlatform.buildRustPackage rec {
  pname = "xornet-reporter";
  version = "0.17.3";
  src = fetchFromGitHub {
    owner = "Bluskript";
    repo = "Reporter";
    rev = "f15eacfc7778b88e00e6fb597eb2e7cba0ec4c0f";
    hash = "sha256-3OSi4fk65jqtornvHkjUD9/N+5U5ZRB/SP99Re3Hg9E=";
  };

  # src = ./.;

  cargoDepsName = pname;
  cargoLock.lockFile = "${src}/Cargo.lock";

  nativeBuildInputs = [
    openssl
    pkg-config
    perl
  ];

  meta = with lib; {
    description = "The data collector that gets your system's state and sends it to the backend";
    homepage = "https://github.com/otiskujawa/Reporter";
    license = licenses.gpl3;
    maintainers = [ ];
  };
}
