# My configuration

## Installation

1. Clone the repo in `~/dotfiles`
2. Install Homebrew (see below)
3. Install Gnu Stow (`brew install stow`)
4. Run `stow .` from the dotfile directory
5. Install everything with `brew bundle --global`

## Manual installation

### Brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Rust

```sh
curl https://sh.rustup.rs -sSf | sh
```

