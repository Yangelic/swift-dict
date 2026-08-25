# swift-dict


![Terminal demo of dict](docs/demo.gif)


A tiny Swift CLI that pipes macOS's built-in Dictionary straight to your terminal.

### Why?

I use a quick terminal so there is no need for additional gestures, alt-tabs, workspace swaps, etc. I stay focused on what I am doing without switching screens or managing windows.

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
