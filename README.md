# quotes
A simple simple cli app to show stoic quotes I made whilst trying out Crystal

## Installation
First test if you have crystal installed by running `which crystal`
If you don't have it installed install it with your package manager
On macOs `brew install crystal`
On Arch Linux `sudo pacman -Syu crystal`

To download and build the binary run the following commands
```bash
git clone https://github.com/NewDawn0/quotes.git
crystal build quotes.cr
```

## Usage
Description from the --help flag
```bash
Quotes - by NewDawn0
Usage: quotes [arguments]
    -n NAME, --name NAME             Gets a quote by the name entered
    -v, --version                    Show version
    -r, --random                     Show random quote
    -h, --help                       Show help
```
If no arguments are provided quotes will chose a random quote
