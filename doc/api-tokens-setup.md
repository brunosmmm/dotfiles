# API tokens via `pass`

Tokens live in `pass`. `~/.config/projects/api-tokens.json` maps environment
variable names to pass entry paths. That file is gitignored.

`dottokens` edits the mapping. `keys-setup` exports the values into the current
fish session. A Python process cannot export variables into the shell that
launched it, so loading stays in fish.

## Prerequisites

- `pass` initialized and working
- `rich` (`python3 -m pip install --user rich` or the distro package)
- `jq` (for `keys-setup`)
- `$KEY_CONFIG_FILE` set (host `conf.d` does this)

## Manage bindings

```fish
dottokens                         # list (default)
dottokens add                     # prompts for name + pass path
dottokens add OPENAI_API_KEY api-tokens/openai
dottokens add OPENAI_API_KEY api-tokens/openai --insert
dottokens remove OPENAI_API_KEY
dottokens remove OPENAI_API_KEY --from-pass
dottokens check
```

`add` refuses a path that is not in the store unless you pass `--insert` or
confirm the prompt (interactive). `--insert` runs `pass insert`.

`remove` only unbinds. `--from-pass` also deletes the store entry.

After add or remove, run `keys-setup` in this shell to refresh exports.

## Load into fish

```fish
keys-setup
```

That reads `api-tokens.json`, calls `pass show` for each entry, and
`set -gx VAR value`. Missing `api-tokens.json` is skipped. A missing pass
entry warns and continues.

## File locations

| File | Purpose |
|------|---------|
| `~/.config/projects/keys.json` | SSH key paths mapped to `pass` entries |
| `~/.config/projects/api-tokens.json` | Env var names mapped to `pass` entries |
| `~/.local/bin/dottokens` | Mapping CLI |
| `~/.config/fish/functions/keys-setup.fish` | Loader |
