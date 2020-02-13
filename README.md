# linux-desktop

This repository contains [joshrosso](https://twitter.com/joshrosso)'s
configuration for his daily driver.

## Commands

To update this repo's contents run:

```
make update
```

Arch package install:

```
sudo make install-packages
```

AUR package install:

```
make install-aur-packages
```

To configure the machine:

```
make configure && sudo make configure0-sudo
```

Window manager compilation/install:

```
sudo make install-wm
```

Terminal manager compilation/install:

```
sudo make install-term
```
