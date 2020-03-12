with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "dwm-custom";

  src = fetchFromGitHub {
    owner = "epeery";
    repo = "dwm";
    rev = "ce1524868ab7e1553c5e2d2a42f084988c4d567f";
    sha256 = "0ncg6b8cavg56x58anhq7j8yn418s77rqklw5l3w41k3d0sif3bl";
  };

  buildInputs = [ xorg.libX11 xorg.libXinerama xorg.libXft ];

  buildPhase = " make";

  installPhase = ''
    mkdir -p "$out/bin"
    cp ./dwm "$out/bin/"
    mv "$out/bin/dwm" "$out/bin/dwm-custom"
  '';
}
