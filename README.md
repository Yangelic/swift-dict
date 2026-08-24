# dict


![Terminal demo of dict](docs/demo.gif)


A small macOS command-line interface to the built-in Dictionary service.

## Requirements

- macOS
- Xcode Command Line Tools

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/YOUR-GITHUB-USERNAME/macos-dict-cli/main/install.sh | sh
```


The command installs `dict` to `~/.local/bin/dict`.

Ensure `~/.local/bin` is on your `PATH`:

```sh
export PATH="$HOME/.local/bin:$PATH"
```
or

```
git clone https://github.com/YOUR-GITHUB-USERNAME/macos-dict-cli.git
cd macos-dict-cli
cat install.sh
./install.sh
```

## Usage

```sh
dict serendipity
dict ipso facto
```

## Notes

Results use the dictionaries enabled in **Dictionary → Settings** on macOS.

## License

[MIT](LICENSE)
