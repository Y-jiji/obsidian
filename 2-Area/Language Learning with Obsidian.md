---
tags:
  - 𝔉-note
  - 𝔗-obsidian
---
# Deutsch

Deutsch Sprechen: 

```sh
echo {{selection}} | \
pandoc -f markdown+wikilinks_title_after_pipe -t plain | \
piper-tts --model /usr/share/piper-voices/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx --output-raw --quiet | \
aplay -D pipewire -r 22050 -f S16_LE -t raw - >& /dev/null
```

# English

English Speaking: 

```sh
echo {{selection}} | \
pandoc -f markdown+wikilinks_title_after_pipe -t plain | \
piper-tts --model /usr/share/piper-voices/en/en_US/amy/low/en_US-amy-low.onnx --output-raw --quiet | \
aplay -D pipewire -r 22050 -f S16_LE -t raw - >& /dev/null
```
