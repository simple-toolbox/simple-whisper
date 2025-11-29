#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: download-model.sh

Downloads ggml-large-v3-turbo.bin to $HOME/models/whisper/ggml-large-v3-turbo.bin. No options.
EOF
  exit "${1:-0}"
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage 0
fi

if [ "$#" -ne 0 ]; then
  usage 1
fi

model_path="$HOME/models/whisper/ggml-large-v3-turbo.bin"
model_url="https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo.bin"
model_dir="$(dirname -- "$model_path")"

mkdir -p -- "$model_dir"

if [ -f "$model_path" ]; then
  echo "Model already exists at $model_path"
  exit 0
fi

downloader=""
if command -v curl >/dev/null 2>&1; then
  downloader="curl"
elif command -v wget >/dev/null 2>&1; then
  downloader="wget"
else
  echo "Install curl or wget to download the model."
  exit 1
fi

# Download to a temp file inside the destination directory to avoid /tmp space issues
tmpfile="$(mktemp "$model_dir/whisper-model-XXXXXX.tmp")"
cleanup() {
  [ -n "$tmpfile" ] && [ -f "$tmpfile" ] && rm -f "$tmpfile"
}
trap cleanup EXIT

echo "Downloading ggml-large-v3-turbo.bin (~1.8GB) to $model_path..."

if [ "$downloader" = "curl" ]; then
  curl -L --fail --output "$tmpfile" "$model_url"
else
  wget -O "$tmpfile" "$model_url"
fi

mv -- "$tmpfile" "$model_path"
chmod 644 "$model_path"
tmpfile=""

echo "Model saved to $model_path"
