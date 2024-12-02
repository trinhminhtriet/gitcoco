#!/bin/bash
set -xe

[ -z "$(git status --porcelain)" ] || (echo "dirty working directory" && exit 1)

current_version="$(grep '^version = ' Cargo.toml | head -1 | cut -d '"' -f2)"
new_version="$1"
semver=${new_version#v}

if [ -z "$new_version" ]; then
    echo "New version required as argument"
    exit 1
fi

echo ">>> Bumping version"
sed -i.bak "s/version = \"$current_version\"/version = \"$semver\"/" Cargo.toml
rm Cargo.toml.bak

echo ">>> Running tests"
cargo build
cargo test

sleep 5

echo ">>> Commit"
git add Cargo.toml Cargo.lock
git commit -am "v$new_version"
git tag v$new_version

echo ">>> Publish"
git push
git push origin v$new_version
