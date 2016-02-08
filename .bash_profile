# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-3

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

export C=/cygdrive/c
export WORKSPACE=/cygdrive/c/Users/jschweers/workspace/Dimagi
export TESTING=/cygdrive/c/Users/jschweers/workspace/Dimagi/commcare-odk/app/assets/testing/

alias fj="find . -name *.java | grep $1"

alias ga="git add"
alias gb="git branch -v"
alias gco="git checkout"
alias gd="git diff"
alias gs="git status"

alias gab="git-all-branch"
alias gas="git-all-status"

alias b="git branch | grep '^\*' | sed 's/* //'"
alias gp='git push origin $(b)'

# default pt to regex search
alias pt='pt -e'

export LC_CTYPE=en_US.UTF-8
export HISTCONTROL=ignorespace
export HQ=~/Documents/Dimagi/commcare-hq
export VELLUM=~/Documents/Dimagi/Vellum
export HQVELLUM=~/Documents/Dimagi/commcare-hq/submodules/formdesigner
export VELLUM_DIR=$VELLUM
export VELLUM_STAGING_FIX=1

alias ve="source ~/.virtualenvs/commcare-hq/bin/activate"

# for tmuxinator
export EDITOR=vim
export PROMPT_COMMAND='history -a; history -r'

# for pt
export Home=/Users/jschweers

function vimsearch() {
    pt "$1" | cut -f1 -d: | sort -u | xargs -o vim
}

# open any files modified by git
# doesn't open untracked files
function gsopen() {
    gs | grep modified: | cut -f2 -d: | xargs -o vim
}
