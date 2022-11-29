# dotfiles
I like to have a baseline config to work with on many servers or dev machines I connect to. I can use this public repository to set the basic dotfile and then a couple of lines in my .bashrc to localize the changes:

```bash
if [ -d $HOME/'dotfiles' ]; then
  git -C $HOME/dotfiles pull --ff-only --quiet
  find $HOME/dotfiles/ -maxdepth 1 -type f ! -name "README.md" -exec cp {} $HOME/ \;
else
  git clone https://github.com/joneswac/dotfiles $HOME/dotfiles
  find $HOME/dotfiles/ -maxdepth 1 -type f ! -name "README.md" -exec cp {} $HOME/ \;
fi
```

Stupid, but simple.
