# homebrew-porchlight

The Homebrew tap for [porchlight](https://github.com/alejandrovdev/porchlight), which keeps
Claude Code sessions ready on your Mac so you can start, follow and close them from the
Claude mobile app.

## Install

```sh
brew install alejandrovdev/porchlight/porchlight
porchlight --version
```

The formula installs tmux and the Python porchlight runs on. Claude Code is a cask, which a
formula cannot depend on: `porchlight setup` offers to install it.

Then set up this Mac and link a project, as porchlight's
[quick start](https://github.com/alejandrovdev/porchlight#quick-start) shows.

## Uninstall

Remove porchlight's background agents first, since they run the installed command:

```sh
porchlight uninstall
brew uninstall porchlight
brew untap alejandrovdev/porchlight
```

What each step keeps, and how to remove the rest, is in
[Uninstall](https://github.com/alejandrovdev/porchlight/blob/main/docs/setup.md#uninstall).

## Problems

Report a problem with porchlight in
[its repository](https://github.com/alejandrovdev/porchlight/issues), and a vulnerability
privately, as its [security policy](https://github.com/alejandrovdev/porchlight/blob/main/SECURITY.md)
says.

## License

[MIT](LICENSE).
