# API Tokens via `pass` in `keys-setup`

The `keys-setup` fish function can automatically export API tokens as environment
variables. Tokens are stored in `pass` and mapped to environment variable names
through a JSON config file.

## Prerequisites

- `pass` (the standard unix password manager) initialized and working
- `jq` installed
- The `$KEY_CONFIG_FILE` environment variable set (e.g. `~/.config/projects/keys.json`)
- GPG agent unlocked (handled by `keys-setup` itself via `keychain`)

## Setup

### 1. Store tokens in `pass`

For each API token, insert it into the pass store:

```sh
pass insert api.techfab.dev/credentials
```

Use whatever path structure makes sense. The path you choose here is what you
reference in the config file.

### 2. Create the config file

Create `api-tokens.json` in the same directory as `$KEY_CONFIG_FILE`
(typically `~/.config/projects/api-tokens.json`). This file is gitignored
and must not be committed:

```json
{
  "TECHFAB_CREDENTIAL": "api.techfab.dev/credentials"
}
```

Each key is the environment variable name that will be exported. Each value is
the `pass` entry path.

To add more tokens, add more entries:

```json
{
  "TECHFAB_CREDENTIAL": "api.techfab.dev/credentials",
  "OPENAI_API_KEY": "api-tokens/openai",
  "ANTHROPIC_API_KEY": "api-tokens/anthropic"
}
```

### 3. Run `keys-setup`

```sh
keys-setup
```

The function loads SSH/GPG keys as before, then reads `api-tokens.json` and
for each entry calls `pass show <entry>` and exports the result as a global
environment variable (`set -gx`).

Since the GPG agent is already unlocked earlier in the function, `pass show`
won't prompt for the passphrase again.

## Behavior

- If `api-tokens.json` doesn't exist, the token loading step is silently skipped.
- If a specific token can't be retrieved from `pass`, a warning is printed and
  the remaining tokens are still loaded.

## File locations

| File | Purpose |
|------|---------|
| `~/.config/projects/keys.json` | SSH key paths mapped to `pass` entries |
| `~/.config/projects/api-tokens.json` | Env var names mapped to `pass` entries |
| `~/.config/fish/functions/keys-setup.fish` | The fish function |

## Relevant code

The token-loading block added to `keys-setup.fish`:

```fish
# Load API tokens from pass
set -l api_tokens_file (dirname $KEY_CONFIG_FILE)/api-tokens.json
if test -f $api_tokens_file
    set -l token_vars (cat $api_tokens_file | jq -r 'keys[]')
    for var in $token_vars
        set -l passentry (cat $api_tokens_file | jq -r ".\"$var\"")
        set -l token (pass show $passentry 2>/dev/null)
        if test $status -eq 0
            set -gx $var $token
        else
            echo "WARNING: failed to retrieve token for $var from pass entry '$passentry'"
        end
    end
end
```
