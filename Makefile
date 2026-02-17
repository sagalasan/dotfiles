# Core implementation of the dotfiles management logic
#
# Run `make` for a list of targets. See README.md for more details.

.NOTPARALLEL:

.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help message
	@grep -E "^[a-zA-Z_-]+:.*?## .*$$" $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: submodule
submodule: ## Initialize and update git submodules
	git submodule update --init --recursive

.PHONY: stow
stow: ## Symlink core dotfiles using stow
	stow -v -t ~ core

.PHONY: stow-dry-run
stow-dry-run: ## Dry run of stow command
	stow --simulate -vt ~ core
