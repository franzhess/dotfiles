# My configuration

My macOS development setup: Zsh, WezTerm, tmux with Nord, Helix,
Neovim/LazyVim, and OpenCode. GNU Stow links the configuration into my home
directory; `.Brewfile` lists the applications and development tools.

## Installation

1. Clone the repo in `~/dotfiles`
2. Install Homebrew (see below)
3. Install GNU Stow (`brew install stow`)
4. From `~/dotfiles`, preview links with `stow --simulate --verbose .`, then
   run `stow .`. Back up conflicting files before proceeding; do not blindly
   use `--adopt`, which moves existing files into the repository.
5. Review `.Brewfile`, then install its dependencies with
   `brew bundle --file=.Brewfile`. VS Code must be installed separately for
   the extension entries.
6. Install tmux's plugin manager if it is not already present:

   ```sh
   git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
   ```

   Start tmux and press **Ctrl-b, Shift-i** to install Nord, sessionx,
   resurrect, and continuum. The prefix and other keybindings remain at
   their configured defaults.

7. Open a new login shell, launch Neovim to install its plugins, and run
   `bat cache --build` to register the included themes.

To remove the symlinks without deleting this checkout, run `stow --delete .`
from `~/dotfiles`.

## Configuration and workflow

- `.zprofile` initializes the login-shell environment, PATH, and toolchains.
  `.zshrc` configures interactive hooks, aliases, history, and keybindings.
- `tns [directory]` creates or selects a tmux session. Without an argument,
  it searches `~/dotfiles`, `~/Projects`, and `~/Work`. New sessions source
  a directory-level `.tmux-sessionizer`, or the home-level fallback: use
  this only with trusted directories, since hooks execute shell code.
- `Work/.envrc` switches Git, SSH, AWS, Codex, and OpenCode to private work
  profiles under `~/Work`. Supply those files yourself and review the
  environment before running `direnv allow` there.
- `scripts/fzf-git.sh` is vendored from
  [Junegunn Choi](https://github.com/junegunn/fzf-git.sh) and retains its MIT
  license. Neovim is based on the attributed LazyVim starter.

Review staged files before publishing: GitHub authentication metadata and
other machine-local files should not accidentally include credentials.

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

This is an optional, separate installation. Cargo's bin directory is already
added to PATH by `.zprofile` through `~/.cargo/env`; no extra PATH entry is
needed. Run `hx --health` to check installed language servers.

```sh
cargo install --locked --git https://github.com/estin/simple-completion-language-server.git
simple-completion-language-server fetch-external-snippets
```

### Haskell

```sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
cabal install ormolu
```
