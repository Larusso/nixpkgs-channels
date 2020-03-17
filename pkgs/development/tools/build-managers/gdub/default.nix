{ stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation rec {
  pname = "gdub";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "dougborg";
    repo = "gdub";
    rev = "v${version}";
    sha256 = "070kfkyrkr98y1hbhcf85842c0x7l95w1ambrkdgajpb6kcmpf84";
  };

  preferLocalBuild = true;
  dontBuild = true;

  phases = "installPhase";
  
  installPhase = ''
    outdir=$out/bin
    mkdir -p $outdir
    cp -r $bin/* $outdir
  '';

  meta = with stdenv.lib; {
    description = "A gradlew / gradle wrapper.";
    homepage = "https://www.gdub.rocks/";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}