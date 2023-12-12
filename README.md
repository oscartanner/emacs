# emacs
Config files for emacs

## Running emacs Daemon

### Emacs Daemon

In AppleScript application, paste:

```
tell application "Terminal"
	do shell script "/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"
end tell
```

Remember to add this to the LoginItems to be loaded at startup

### Emacs client

In Automator create a Run Shell script as follow:
* Shell: /bin/zsh
* Pass input: as arguments
```
/usr/local/bin/emacsclient \
    --no-wait \
    --quiet \
    --suppress-output \
    --create-frame \
    "$@"
```
