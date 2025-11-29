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

Whisper is an open-source speech-recognition model released by OpenAI. This utility is an independent project and is not affiliated with or endorsed by OpenAI.
