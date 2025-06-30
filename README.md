# NcVim

## What is this?

My own Neovim config. The main thing I don't like in AstroNvim and others is that they tend to be more usual IDEs -like. I'm pretty used to Vim hotkeys, so I created my own config with little overrides. E.g. to save a file you still need to do `:w`. And if you like you can bind it to a hotkey.

## Features

* As little custom mappings as possible
* Loads `.env.lua` from your project folder to specify environment variables or project specific settings.

## Installation

1. Launch `./install`
1. ???????
1. PROFIT!

## Configuration
### General
In NcVim folder create `lua/custom` and have fun in that folder. Anything you export from there as lua module, will be loaded.

### CodeCompanion
You can easily customize CodeCompanion for NcVim.
1. Adapters
  1. In NcVim create `./lua/custom/codecompanion_adapter.lua`
  2. return Adapters config from that module. It will be passed directly to CodeCompanion config

1. SystemPrompt
  1. In NcVim create `./lua/custom/codecompanion_system_prompt.lua`
  2. return the following table:
  ```lua
    return {
      character = {
        name = "string", -- chat name
      },
      system_prompt = "string", -- system_prompt
    }
  ```
  I use this structure to define some specific fun characters like GLaDOS from Portal as code companions :)

## TODO

- [ ] How to configure NcVim

