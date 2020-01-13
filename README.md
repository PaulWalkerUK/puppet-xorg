# xorg

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with xorg](#setup)
    * [What xorg affects](#what-xorg-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with xorg](#beginning-with-xorg)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module provides a simple setup of Xorg. At the moment, it only installs Xorg Server and provides an option for specifying the keyboard
layout.

## Setup

### What xorg affects

The following packages will be installed:
* `xorg-server`

If the keyboard layout is specified (via the `keyboard_layout` parameter), then the following packages will also be installed:
* `libxkbcommon`

### Beginning with xorg

To install Xorg server, you only need:

```puppet
include xorg
```

## Usage

To just install Xorg server, you only need:

```puppet
include xorg
```

To set the keyboard layout, use the `keyboard_layout` parameter. This controls the `layout` as described in https://www.freedesktop.org/software/systemd/man/localectl.html. 
For example, to set it to GB (UK):

```puppet
class { 'xorg' :
  keyboard_layout => 'gb',
}
```

## Limitations

This has been designed for and tested on Arch Linux.

## Development

Pull requests are welcome.