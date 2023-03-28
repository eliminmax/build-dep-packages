#!/bin/sh

set -eu

if ! command -v equivs-build >/dev/null; then
    printf 'Command equivs-build not found. It is provided by the \e[1;7mequivs\e[m package.\n' >&2
    exit 1
fi

cd "$(dirname "$(realpath "$0")")"

mkdir -vp _build

for dir in ./*/; do
    if [ -f "$dir/control" ]; then
        cd "$dir"
        built_package="$(equivs-build control | sed -e '/dpkg-deb: building package/!d' -e 's@^[^'\'']*'\''[^'\'']*'\'' in '\''\.\./\([^'\'']*\).*$@\1@')"
        cd ..
        cp "$dir/$built_package" "_build/$built_package"
    fi
done
