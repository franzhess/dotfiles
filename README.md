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

### Simple Completions Language Server

Allow simple auto-completions in Helix

```sh
cargo install --locked --git https://github.com/estin/simple-completion-language-server.git
simple-completion-language-server fetch-external-snippets
```

### Haskell

```sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
cabal install ormolu
```
