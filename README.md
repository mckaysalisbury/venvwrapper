# venvwrapper

A simple wrapper around `venv` to manage virtual environments in python.

I love `virtualenvwrapper`, but I love standards more, and python now has
`venv` as its standard virtual environment manager. But python didn't supply a
wrapper, so I'm making this one, inspired by `virtualenvwrapper`.

## Installation

1. Download the repo (it's only three files, and one is this README, and another is the LICENSE)
2. Put the repo wherever you like.
3. In your CLI, navigate to the folder in your command line
4. Execute the command below to add the commands to your CLI

### Linux

`echo . $(realpath venvwrapper.sh) >> ~/.bashrc`

### Mac OS X
`echo . $(realpath venvwrapper.sh) >> ~/.bash_profile`

### Windows

I personally do my python development in [WSL Ubuntu](
    https://docs.microsoft.com/en-us/windows/wsl/install-win10).

## Usage

* `mkvenv NAME` (creates a new environment named `NAME`)
* `deactivate` (deactivates the current environment)
* `lsvenv` (lists all of the virtual environments you've already created)
* `activate NAME` (activates the previously-created environment named `NAME`)
* `rmvenv NAME` (removes the previously-created environment named `NAME`)

### License

This software is licensed under the MIT License. See the `LICENSE` file.
