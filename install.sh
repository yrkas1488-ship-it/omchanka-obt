#!/usr/bin/env bash
set -Eeuo pipefail
VERSION=v0.1.1.5
REPO=yrkas1488-ship-it/omchanka-obt
die() { printf '%s\n' "$*" >&2; exit 1; }
[[ $EUID == 0 ]] || die 'Запусти команду от root.'
[[ $(uname -s) == Linux ]] || die 'Нужен Linux.'
case $(uname -m) in
  x86_64) arch=amd64 ;;
  aarch64|arm64) arch=arm64 ;;
  *) die 'Поддерживаются amd64 и arm64.' ;;
esac
command -v apt-get >/dev/null || die 'Поддерживаются Ubuntu и Debian.'
if ! command -v curl >/dev/null || ! command -v sha256sum >/dev/null; then
  apt-get update
  apt-get install -y curl ca-certificates coreutils
fi
scratch=$(mktemp -d /tmp/omchanka-binary.XXXXXX)
trap 'rm -rf -- "$scratch"' EXIT
asset="omchanka-linux-$arch.tar.gz"
base="https://github.com/$REPO/releases/download/$VERSION"
echo "Скачиваем Омчанку $VERSION ($arch), без сборки Rust на сервере…"
curl -fL --retry 3 --connect-timeout 15 "$base/$asset" -o "$scratch/$asset"
curl -fL --retry 3 --connect-timeout 15 "$base/SHA256SUMS.txt" -o "$scratch/SHA256SUMS.txt"
# Accept checksum files produced on either Linux or Windows.
sed -i 's/\r$//' "$scratch/SHA256SUMS.txt"
expected=$(awk -v file="$asset" '$2 == file {print $1}' "$scratch/SHA256SUMS.txt")
[[ $expected =~ ^[0-9a-f]{64}$ ]] || die 'Не найдена контрольная сумма сборки.'
printf '%s  %s\n' "$expected" "$scratch/$asset" | sha256sum -c -
tar -xzf "$scratch/$asset" -C "$scratch"
for file in "$scratch"/*.sh; do sed -i 's/\r$//' "$file"; done
bash "$scratch/install.sh" "$@"
