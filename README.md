# Fedora Dotfiles - the @S1SYPHOS way

This repository houses the [dotfiles](https://dotfiles.github.io) used when setting up Fedora on my [personal workstation](https://github.com/S1SYPHOS/workstation).

It's a work in progress, with many aliases left to chase ..


## Getting started

Just install Anish Athalye's [`dotbot`](https://github.com/anishathalye/dotbot), which makes symlinking your dotfiles a breeze. All that's left to do is cloning the repo to `~/.dotfiles` and fire it up:

```shell
# Clone the repository
git clone --recursive https://github.com/S1SYPHOS/dotfiles.git ~/.dotfiles

# Symlink all the things
cd ~/.dotfiles
bash install.sh

# Making an alias makes it even easier
alias dotbot="bash ~/.dotfiles/install.sh"
```


## Roadmap:
- [x] Move to [dotbot](https://git.io/dotbot)
  - Ability to create folders, eg .ssh/sockets
  - Own folder setup for configs above `.config`
- [ ] Add more dotfiles & configs (tmux, vim, aria2)
- [x] ~~Add aliases for git-extra packages~~

## Credits
I got a lot of inspiration from similar projects & incredibly useful resources all over the internet, just to name a few:
- [bash-it](https://github.com/Bash-it/bash-it)
- [sensible-bash](https://github.com/mrzool/bash-sensible)
- .. several dotfile repositories hosted on Github, reallly
