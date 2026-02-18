# Dotfiles

A layered dotfiles management system using GNU Stow and Make.

## Repository Layout

* `layers/`: Contains configuration layers. Each subdirectory is a Stow package.
* `layers/core/`: The base configuration tracked by this repository.
* `Makefile`: Automation for symlinking and Git configuration.

### Core Structure

The `layers/core/` directory mimics the structure of your home directory. Files here are stowed directly to `~`. For example:
* `.zshrc` -> `~/.zshrc`
* `.gitconfig` -> `~/.gitconfig`
* `.bashrc.d/` -> `~/.bashrc.d/`

## Prerequisites

Ensure you have the following installed:
* `git`
* `make`
* `stow` (GNU Stow)

On Debian/Ubuntu-based systems, you can install them with:
```bash
sudo apt install git make stow
```

## Setup

1. Clone this repository.
2. Initialize and update submodules:
   ```bash
   make submodule
   ```

## Usage

The Makefile handles the complexity of GNU Stow.

* `make stow`: Symlinks all layers found in `layers/` to your home directory.
* `make stow-dry-run`: Shows what would happen without making any changes.
* `make unstow`: Removes the symlinks.
* `make clean`: Removes symlinks and deletes the local gitconfig.

## Layers and Customization

Everything inside `layers/` except for `core/` is ignored by Git (see `.gitignore`). This allows you to clone additional, private, or machine-specific configurations into the `layers/` folder as independent Git repositories.

### Example: Work Layer

To add a "work" specific configuration:

1. Clone your work repository into `layers/work`:
   ```bash
   git clone git@github.com:youruser/work-dotfiles.git layers/work
   ```
2. Run `make stow` to apply the changes.

The Makefile dynamically gathers all subdirectories in `layers/` and applies them during the stow operation.