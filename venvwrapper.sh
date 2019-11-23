#!/usr/bin/env bash
# Summary: Setup the wrapper functions into the current shell
# Usage: . venvwrapper.sh

VENVWRAPPER_CALLER=$_

# Setup home directory
if [ -z $1 ]
then
    VENVWRAPPERDIRECTORY="$HOME/.venv-wrapper-environments"
    echo "Using $VENVWRAPPERDIRECTORY as the location for virtual environments"
    echo "(pass a parameter to the venv-wrapper script to override)"
else
    VENVWRAPPERDIRECTORY=$1
    shift
fi

# Ensure directory creation priviliges
mkdir -p "$VENVWRAPPERDIRECTORY"
echo "venv-wrapper is configured and running"

# Set up all functions

activate() {
    if [ -z $1 ]
    then
        echo "activates a previously-created virtual environment"
        echo "Usage: activate VIRTUALENVIRONMENTNAME"
    else
        . "$VENVWRAPPERDIRECTORY/$1/bin/activate"
    fi
}

mkvenv() {
    echo "Directory $VENVWRAPPERDIRECTORY"
    if [ -z $1 ]
    then
        echo "Creates a virtual environment"
        echo "Usage: mkvenv VIRTUALENVIRONMENTNAME"
    else
        if [ -d "$VENVWRAPPERDIRECTORY/$1" ]
        then
            echo "That venv already exists"
        else
            echo "Creating a venv named $1"
            python3 -m venv "$VENVWRAPPERDIRECTORY/$1"
            activate $1
        fi
    fi
}

rmvenv() {
    if [ -z $1 ]
    then
        echo "Removes a virtual environment"
        echo "Usage: rmvenv VIRTUALENVIRONMENTNAME"
    else
        if [ -d "$VENVWRAPPERDIRECTORY/$1" ]
        then
            rm -r "$VENVWRAPPERDIRECTORY/$1"
            echo "Removed venv $1"
        else
            echo "That venv does not exist"
        fi
    fi
}

lsvenv() {
    ls $VENVWRAPPERDIRECTORY $*
}


# Check for inclusion in .bashrc script
if [[ $VENVWRAPPER_CALLER != *"bash-completion"* ]]
then
    echo ""
    echo "You probably want this run in your '.bashrc' script."
    echo "echo . $(realpath $BASH_SOURCE) $VENVWRAPPERDIRECTORY >> ~/.bashrc"
fi

# Check for whether it's been sourced
if [ $0 == $BASH_SOURCE ]
then
    echo ""
    echo "This should be run sourced. I don't think it was run sourced. (prepend 'source' or '.')"
fi