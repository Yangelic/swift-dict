# dict


![Terminal demo of dict](docs/demo.gif)


A small macOS command-line interface to the built-in Dictionary service.

## Requirements

- macOS
- Xcode Command Line Tools

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/Yangelic/swift-dict/main/install.sh | sh
```


The command installs `dict` to `~/.local/bin/dict`.

Ensure `~/.local/bin` is on your `PATH`:

```sh
export PATH="$HOME/.local/bin:$PATH"
```
or

```
git clone https://github.com/Yangelic/swift-dict.git
cd swift-dict
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

`dict` is a common command name and may collide with other tools
on some systems. Rename the compiled binary if needed, e.g.
`mv ~/.local/bin/dict ~/.local/bin/sdict`.

## License

[MIT](LICENSE)
