#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "${BASH_SOURCE[0]}")"

docker build -t godot-vintage-builder .
# Use built-in, statically-linked OpenSSL to avoid issues on recent Linux distributions.
docker run --rm --volume "$PWD/bin":/artifacts godot-vintage-builder sh -c '
git clone --branch="1.0-stable" --depth=1 https://github.com/godotengine/godot.git
cd godot
scons platform=x11 target=release_debug openssl=builtin -j$(nproc)
strip bin/godot.x11.opt.tools.64
mv bin/godot.x11.opt.tools.64 /artifacts
ls -l /artifacts
'
