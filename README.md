# dotfiles

This is a repo storing my configuration files.

It's mainly for personal use (in order to use the same configuration in
different machines), but feel free to use or modifying them, according to your
needs.

## Installation

In order get the files, clone the files in the directory that you want to store
and run the installation script. The script will backup your existing dotfiles
(inside ``backups`` directory of the dotfiles directory) and will create
symlinks for new ones.

In order to install dotfiles open a shell and type the following commands
(after you have changed to a desired directory).

```bash
git clone https://github.com/iSaran/dotfiles.git
./dotfiles/install.sh
```

Notice that, now you will have another ``~/.bashrc``, that you can add
anything you want without messing with the original ``~/.bashrc`` of
your system. In order to find the location of the new ``~/.bashrc`` file
type:

```bash
echo $MYBASHRC
```
And you can edit it using a text editor (eg vim) with:

```bash
vim $MYBASHRC
```

In order to source it you have to source the original file:

```bash
. ~/.bashrc
```

## Dotfiles directory
Your dotfile directory can be found in:

```bash
echo $DOTFILES_DIR
```
