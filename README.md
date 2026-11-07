# Dotfiles

Copy-based overlays for personal machines, plus `scripts/dotupdate` to install
them into `$HOME` and copy local edits back into the repo.

This is not GNU Stow. Files are copied, not symlinked.

## Layout

| Path | Role |
|------|------|
| `dot/` | Shared overlay (fish functions, gtk, tmux fragment, scripts) |
| `dot.bruno-yoga9i/` | Laptop: Wayland/sway, kanshi, waybar, ssh |
| `dot.morais-Desktop/` | Desktop: X11/i3, picom, dunst, rofi |
| `scripts/dotupdate` | Install / update CLI (`python3`) |
| `doc/` | Package lists and setup notes |
| `bootstrap/` | Abandoned Arch/X11 package sketches; not used |

Each overlay is a directory that contains an empty `.dotfiles` marker.
Inventory is `git ls-files` in that directory, not the marker contents.

Hostname must match the overlay suffix (`$hostname` in fish). A missing
`dot.$hostname` directory is skipped with a warning.

## Path mapping

- A directory `config/foo` in an overlay installs to `~/.config/foo`.
- A file at the overlay root named `dot.spacemacs` installs to `~/.spacemacs`.
- Only git-tracked files are installed. Untracked files are invisible to the tool.

Host overlay files overwrite the shared copy when both map to the same home path.

## First boot (before fish helpers exist)

`dotfiles-install` needs `~/.config/projects/projects.json` and the fish
functions already on `fish_function_path`. On a new machine, clone this repo
and run the Python tool directly:

```sh
python3 scripts/dotupdate "$(pwd)/dot" install --new-files
python3 scripts/dotupdate "$(pwd)/dot.$HOSTNAME" install --new-files
```

`--new-files` is required for non-interactive install of paths that do not
yet exist under `$HOME`. Interactive install (the fish default) always offers
new files.

Then create `~/.config/projects/projects.json` with a `dotfiles` entry pointing
at this clone, or copy it from the host overlay after the first install.

## Day-to-day

Once fish functions are installed:

```fish
dotfiles-install          # repo → $HOME (interactive)
dotfiles-update           # $HOME → repo (interactive)
dotfiles-push             # commit + push the dotfiles project
dotfiles-pull             # pull the dotfiles project
keys-setup                # SSH/GPG via keychain + API tokens from pass
```

Direct CLI:

```sh
scripts/dotupdate <overlay> install [--interactive] [--new-files] [--quiet]
scripts/dotupdate <overlay> update  [--interactive] [--quiet]
scripts/dotupdate <overlay> list
scripts/dotupdate <overlay> inspect <file> [--diff]
```

## Secrets

Passwords and tokens live in `pass`, not in git.

| File | Tracked? | Contents |
|------|----------|----------|
| `~/.config/projects/keys.json` | yes | SSH key path → `pass` entry |
| `~/.config/projects/credentials.json` | yes | username + `pass` entry (no password) |
| `~/.config/projects/api-tokens.json` | **no** | env var → `pass` entry; gitignored |
| `~/.config/musikcube/settings.json` | **no** | session tokens; gitignored. Copy from `dot/config/musikcube/settings.json.example` |
| `~/.ssh/config` | yes | host aliases |

See [doc/api-tokens-setup.md](doc/api-tokens-setup.md) for token loading.

**Last.fm:** session credentials were previously committed in
`dot/config/musikcube/settings.json`. Revoke/rotate that Last.fm session at
https://www.last.fm/settings before logging in again. The file is no longer
tracked.

## Package lists

Informal, not consumed by the installer:

- [doc/requirements](doc/requirements)
- [doc/fish_requirements](doc/fish_requirements)
