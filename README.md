# dotfiles
I like to have a baseline config to work with on many servers or dev machines I connect to. I can use this public repository to set the basic dotfile and then a couple of lines in my .bashrc to localize the changes:

```bash
if [ -d 'dotfiles' ]; then
  git -C dotfiles pull --ff-only --quiet
  find dotfiles/ -maxdepth 1 -type f ! -name "README.md" -exec cp {} . \;
else
  git clone https://github.com/joneswac/dotfiles
  find dotfiles/ -maxdepth 1 -type f ! -name "README.md" -exec cp {} . \;
fi
```

Stupid, but simple.
