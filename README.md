# License

[WTFPL](COPYING)

# There are many like it, but this one is mine

This repository contains tools and configs I use in shell. No graphical stuff,
usable both on server and personal workstation. Battle tested on OS X and
various Linux distributions including Debian, Ubuntu, CentOS.

I'm a big fan of [XDG Base Directory
Specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html)
and organize my dotfiles in a way that they don't clutter the `$HOME`. I was
able to reduce files required to be in `$HOME` to single `.zshenv`, everything
else goes under standard XDG paths or launched via aliases.

# Features

* Extensive Zsh [configuration](zsh/zshrc) and [plugins](zsh/plugins):
  * [pure prompt with async vcs info](https://github.com/intelfx/pure)
  * [completions plugin](https://github.com/zsh-users/zsh-completions)
  * [autosuggestions plugin](https://github.com/tarruda/zsh-autosuggestions)
  * [history substring search plugin](https://github.com/zsh-users/zsh-history-substring-search)
  * [syntax highlighting plugin](https://github.com/zsh-users/zsh-syntax-highlighting)
  * [autoenv plugin](https://github.com/Tarrasch/zsh-autoenv)
  * [autopair plugin](https://github.com/hlissner/zsh-autopair)
  * [zaw](https://github.com/zsh-users/zaw) and [cdr](https://github.com/willghatch/zsh-cdr)
* Vim [configuration](vim/vimrc) and [plugins](vim/bundle) managed by [pathogen](https://github.com/tpope/vim-pathogen)
* Tmux [configuration](tmux/tmux.conf) and [plugins](tmux/plugins)
* Other configs:
  * [Midnight Commander](configs/mc.ini)
  * [ranger](configs/ranger)
  * [quilt](configs/quiltrc)
  * [Git](configs/gitconfig)
  * [htop](configs/htoprc)
* Handy [utilities](tools):
  * [MySQLTuner](https://github.com/major/MySQLTuner-perl)
  * [MongoDB Shell Enhancements](https://github.com/TylerBrock/mongo-hacker)
  * [spark](https://github.com/holman/spark) to draw bar charts right in the console
  * [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) for much better git diff layout
  * [git-extras](https://github.com/tj/git-extras) additional helpers for Git
* [pyenv](https://github.com/yyuu/pyenv), [rbenv](https://github.com/rbenv/rbenv) and [nodenv](https://github.com/nodenv/nodenv)

# Installation

Requirements:
* `zsh` 5.1 or newer (async plugin requires recent enough version of zsh)
* `git` (all external components are added as git submodules
* `make` (optional: required to build mongo-hacker and install git-extras)
* `perl` (optional: used by diff-so-fancy and MySQLTuner)
* `python` (optional: used by several vim plugins, but they won't be activated, if python is missing)
* `ruby` (optional: same case as with python)

Dotfiles can be installed in any dir, but probably somewhere under `$HOME`.
Personally I use `$HOME/.local/dotfiles`. The installation is pretty simple:
```sh
mkdir "$HOME/.local"
cd "$HOME/.local"
git clone https://github.com/z0rc/dotfiles.git
cd dotfiles
./deploy.sh
chsh -s /bin/zsh
```

[Simple deployment script](deploy.sh) helps to set up all required symlinks
after the initial clone. Also it adds cron job to pull updates every midnight
and serves as a post-merge git hook, so you don't have to care about updating
submodules after successful pull.

In case of missing python or ruby, they can be installed via pyenv and rbenv
after the deployment.

## Vim

In order you use all bundled vim plugins, please install vim with python, ruby,
perl and lua support built-in. Also it's strongly recommended to use Vim 8.0 or
newer, as it provides async features required by some plugins.

Debian/Ubuntu:
```
apt-get install vim-nox
```

CentOS/RHEL/Fedora:
```
yum install vim-enhanced
```
or
```
dnf install vim-enhanced
```

OS X:
```
brew install vim --with-python3 --with-luajit
```

# Configuration

## Git
Update `~/.config/git/local/user` with your email and name. Something like
this:
```ini
[user]
    email = jdoe@example.com
    name = John Doe
```

Also you can put additional configuration in `~/.config/git/local/stuff`.

## Zsh
You can add your local configuration into `$ZSHDIR/env.d/9[0-9]_*` and
`$ZSHDIR/rc.d/9[0-9]_*`. The difference is that `env.d` is sourced always while
`rc.d` is sourced in interactive session only.

## Vim
Add your local configuration to `$DOTFILES/vim/vimrc.local`.

## Local paths
Local binaries can be put into `$HOME/.local/bin`, it's added to `$PATH` by
default. Also man pages can be put into `$XDG_DATA_HOME/man`.
