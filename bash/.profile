# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/usr/bin" ] ; then
    PATH="$HOME/.local/usr/bin:$PATH"
fi

## git prompt
if [[ "$USER" == "gerald.pigisch" ]]; then
    _me="gp"
else
    _me="user"
fi

source ~/.git-prompt.sh
PS1='\[\e[01;32m\]$_me@\[\e[01;00m\]\[\e[01;36m\]$(__git_ps1 "(%s)")\[\e[01;00m\]:\[\e[01;34m\]\W\[\e[01;00m\]\$ '
