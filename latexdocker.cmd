:; echo "Running on *nix";  docker run --platform linux -i --rm -w /data -v "$(pwd):/data" danteev/texlive "$*"; exit $?
@ECHO OFF
ECHO Running on Windows
docker run --platform linux -i --rm -w /data -v "%cd%:/data" danteev/texlive %*