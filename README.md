# homebrew-tap

Homebrew formulae for things I ship.

## Install

```bash
brew install ramonclaudio/tap/<formula>
```

Or tap once and use the short form:

```bash
brew tap ramonclaudio/tap
brew install <formula>
```

## Formulae

| name | description |
|---|---|
| [`seetree`](https://github.com/ramonclaudio/seetree) | live terminal tree viewer that lights up as Claude Code edits files |

## How this tap stays in sync

Each formula lives in `Formula/`. Releases of the underlying projects auto-push their rendered formula here via a workflow with a fine-grained PAT. See the source repo's `.github/workflows/release.yml` for the upstream side.

## License

MIT.

[hello@ramonclaudio.com](mailto:hello@ramonclaudio.com) / [GitHub](https://github.com/ramonclaudio) / [X](https://x.com/ramonclaudio) / [ramonclaudio.com](https://ramonclaudio.com)

Ray
