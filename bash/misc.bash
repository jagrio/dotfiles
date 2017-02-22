# Source setup.bash for indigo ros if ros-indigo is installed
if [ -f /opt/ros/indigo/setup.bash ]; then
    . /opt/ros/indigo/setup.bash
fi

# Export to path texlive if Texlive2015 is installed
if [ -d /usr/local/texlive/2015/bin/x86_64-linux ]; then
    export PATH=/usr/local/texlive/2015/bin/x86_64-linux:$PATH
fi

# Export to path texlive if Texlive2016 is installed
if [ -d /usr/local/texlive/2016/bin/x86_64-linux ]; then
    export PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH
fi

# Export to path Iason Dotfiles if dotfiles is installed
if [ -d $HOME/Dropbox/code/scripts ]; then
    export PATH=$PATH:$HOME/Dropbox/code/scripts
fi

# Set some variables
export LC_NUMERIC=C
export LC_COLLATE=C
export TERM="screen-256color"
export MYBASHRC=$DOTFILES_DIR/bash/mybashrc

