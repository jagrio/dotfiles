#!/bin/bash 

# Define variables
VIM=0
BASH=0
PROMPT=0
TMUX=0

# If no arguments provided install everything
if [ $# -eq 0 ]; then
  VIM=1
  BASH=1
  PROMPT=1
  TMUX=1
  echo 'false'
fi

# Check the arguments and set the respective variables
for ARG in "$@"
do
  if [ "$ARG" = "vim" ]; then
    VIM=1
  else
    if [ "$ARG" = "bash" ]; then
      BASH=1
    else
      if [ "$ARG" = "prompt" ]; then
        PROMPT=1
      else
        if [ "$ARG" = "tmux" ]; then
          TMUX=1
        else
          echo "Argument $ARG is not valid. Exiting."
          exit 1
        fi
      fi
    fi
  fi
done

# Function that echos current path
path() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

TIME=`date +%y%m%d_%H%M`
BACKUP_NAME=backup_$TIME

# Find current path of installed dotfiles
SCRIPT_DIR=`path $0`
DOTFILES_DIR=`dirname $SCRIPT_DIR`

cd $DOTFILES_DIR
mkdir -p backups
cd backups
mkdir -p $BACKUP_NAME

echo "Installing dotfiles..."
if [ "$VIM" -eq 1 ]; then
  echo "Installing Vim dependencies..."
  sudo apt-get update
  sudo apt-get install -y vim vim-gtk qgit
  echo "   Configuring ViM..."
  echo "     Checking ~/.vim"
  if [ -d ~/.vim ]; then 
    if [ -L ~/.vim ]; then
      # It is a symlink!  # Symbolic link specific commands go here.
      echo "       Existing symlink found. Deleted it."
      rm ~/.vim
    else
      # It's a directory!  # Directory command goes here.
      #rmdir ~/.vim
      echo "       Existing directory found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/vim"
      mv ~/.vim "$DOTFILES_DIR/backups/$BACKUP_NAME/vim"
    fi
  fi

  echo "     Creating a new ~/.vim"
  mkdir ~/.vim
  echo "     Creating a new symlink ~/.vim/colors"
  ln -s "$DOTFILES_DIR/vim/colors" ~/.vim/colors

  echo "     Checking ~/.vimrc"
  if [ -f ~/.vimrc ]; then 
    if [ -L ~/.vimrc ]; then
      # It is a symlink!  # Symbolic link specific commands go here.
      echo "       Existing symlink found. Deleted it."
      rm ~/.vimrc
    else
      # It's a file!  # Directory command goes here.
      echo "       Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/vimrc"
      mv ~/.vimrc "$DOTFILES_DIR/backups/$BACKUP_NAME/vimrc"
    fi
  fi
  echo "     Creating a new symlink ~/.vimrc"
  ln -s "$DOTFILES_DIR/vim/vimrc" ~/.vimrc

  echo "  Installing ViM's plugins..."

  # Check if git is available
  git --version 2>&1 >/dev/null
  GIT_IS_AVAILABLE=$?
  # ...
  if [ $GIT_IS_AVAILABLE -ne 0 ]; then # If $? var is not 0 then git is not installed
    echo "    Git is not installed. Installing Git for git cloning..."
    sudo apt-get install git
  fi
  git config --global core.editor "vim"
  git config --global diff.tool vimdiff
  git config --global merge.tool vimdiff
  git config --global merge.conflictstyle diff3

  echo "    Cloning Vudle (the plugin manager) from GitHub..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  command -v vim > /dev/null 2>&1 
  VIM_IS_AVAILABLE=$?
  if [ $VIM_IS_AVAILABLE -eq 0 ]; then
    echo "    Installing ViM plug-ins with Vundle..."
    vim +PluginInstall +qall
  fi

  echo "  Installing fonts..."
  echo "    Cloning powerline fonts from GitHub..."
  cd $DOTFILES_DIR
  git clone https://github.com/powerline/fonts.git
  cd fonts
  echo "    Install fonts..."
  ./install.sh
fi

exit 0

  source ~/.bashrc
echo "  Installing dependencies"
sudo apt-get install -y vim vim-gtk git qgit tmux tree subversion pandoc pandoc-citeproc 


# Edit bashrc in order to source my bashrc.
# Any further change will be added to mybashrc
# keeping original bashrc untouched.
echo "   Editing ~/.bashrc: Source mybashrc... "
echo "     Remove previous instances of sourcing mybashrc"
sed -i '/Iason Dotfiles/d' ~/.bashrc  

echo "     Adding a new instance for exporting DOTFILES_DIR var"
echo "DOTFILES_DIR=$DOTFILES_DIR # Iason Dotfiles" >> ~/.bashrc
echo "" >> ~/.bashrc

echo "     Adding a new instance for sourcing mybashrc"
echo "" >> ~/.bashrc
echo "# Iason Dotfiles: Source mybashrc" >> ~/.bashrc
echo "if [ -f $DOTFILES_DIR/bash/mybashrc ]; then # Iason Dotfiles" >> ~/.bashrc
echo "    . $DOTFILES_DIR/bash/mybashrc # Iason Dotfiles" >> ~/.bashrc
echo "fi # Iason Dotfiles" >> ~/.bashrc
echo "" >> ~/.bashrc


# ViM config. Backup possible existing directories and files and remove 
# existing symlinks.


echo "   Configuring tmux..."

echo "     Checking ~/.tmux.conf"
if [ -f ~/.tmux.conf ]; then
  echo "       Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
  mv ~/.tmux.conf "$DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
else
  if [ -L ~/.tmux.conf ]; then 
    echo "       Existing tmux.conf found"
    if [ -h ~/.tmux.conf ]; then
      # It is a symlink!  # Symbolic link specific commands go here.
      echo "       Existing symlink found. Deleted it."
      rm ~/.tmux.conf
    else
      # It's a file!  # Directory command goes here.
      echo "       Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
      mv ~/.tmux.conf "$DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
    fi
  fi
fi

echo "     Creating a new symlink ~/.tmux.conf"
ln -s "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf


echo "Done. Choose one powerline font for your terminal and you are ready to go..."
