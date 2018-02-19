# Set shell prompt
export PS1='\h:\W \$ '

# shell aliases
alias ls="ls -G --color=auto"
alias lr="ls -FlArt"
alias lrh="lr -h"
alias la="ls -al"
alias lh="la -h"
alias ll="ls -l"
alias pu="rm *~"
alias emacs="emacs -nw"
alias open="xdg-open"

# ---------------------------------
# http://www.ljtwebdevelopment.com/pulsarref/pulsar-software-install-ubuntu.html
# Path to the pulsar software installation directory eg:
export ASTROSOFT=/home/pulsar/pulsar_software

# OSTYPE
export OSTYPE=linux
# PATH
# Some Presto executables match sigproc executables so keep separate -
# all other executables are found in $ASTROSOFT/bin
export PATH=$PATH:$ASTROSOFT/bin

export PFILES=/home/pulsar/pfiles
