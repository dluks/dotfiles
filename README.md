# Dotfiles

## Install
1. Install `tmux`, `neovim`, and `stow` if they're not already installed.

1. Clone the repository and navigate to it
    ```console
    cd $HOME
    git clone git@github.com:dluks/dotfiles.git
    cd dotfiles
    ```
1. Run `setup.sh` to install all Tmux Plugin Manager, LazyVIM, Oh My Zsh, as well as a few fonts, plugins, and the `powerlevel10k` theme.
    ```console
    bash setup.sh
    ```
1. Run `stow`
    ```console
    stow .
    ```
1. Fix any merge conflicts (this will certainly happen with `.zshrc`, potentially with others). Use `git status` to see the changes and revert as desired.

