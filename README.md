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
- [x] Add more dotfiles & configs (tmux, vim)
- [x] ~~Add aliases for git-extra packages~~
- [ ] move to i3/sway


## Credits
I got a lot of inspiration from similar projects & incredibly useful resources all over the internet, just to name a few:
- [bash-it](https://github.com/Bash-it/bash-it) (aliases, functions)
- [sensible-bash](https://github.com/mrzool/bash-sensible) (well, sane Bash defaults)
- [Tinu Weber](https://github.com/ayekat/dotfiles), [Terencio Agozzino](https://github.com/rememberYou/dotfiles) and others caring about XDG compliance
- [Emmanuel Rouat](https://tldp.org/LDP/abs/html/sample-bashrc.html) (`.bashrc` resources)
- .. several dotfile repositories hosted on Github and elsewhere .. some even believe, they are [meant to be forked](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked) - but [what if they're not](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)?
