# simple-whisper

Simple command-line tool to transcribe audios with Whisper from your Mac terminal.

```bash
> simple-whisper voice_note.m4a
```

The command above creates `voice_note.raw.txt` (raw transcript) and `voice_note.txt` (cleaned transcript) next to the original file.

## Install

```bash
brew tap simple-toolbox/tools      # required once to pull the simple-toolbox formulas
brew install simple-toolbox/tools/simple-whisper

# downloads ggml-large-v3-turbo.bin to ~/models/whisper/
$(brew --prefix simple-toolbox/tools/simple-whisper)/share/simple-whisper/download-model.sh
```

The ggml-large-v3-turbo model is about 1.8 GB, so the download can take a few minutes depending on your connection.

## Use

```bash
simple-whisper voice_note.m4a
```

- Accepts all common audio formats.
- Writes `voice_note.raw.txt` (raw Whisper transcript) and `voice_note.txt` (lightly cleaned with simple-chatgpt) alongside the source file.
- Looks for the ggml-large-v3-turbo model at `~/models/whisper/ggml-large-v3-turbo.bin` (the download script places it there).

## Disclaimer

simple-whisper is a thin wrapper: whisper.cpp's `whisper-cli` (GGML) does the transcription, and simple-chatgpt cleans it up. Credit belongs to those projects; this repo is not affiliated with OpenAI, whisper.cpp, or the GGML maintainers.
