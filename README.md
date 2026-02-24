# chat.nvim
NeoVim AI Plugin inspired by ThePrimeagen/99

## Installation
Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Add one of the following to your Neovim configuration:

```lua
  {
    'benjaminyakobi/chat.nvim',
    config = function()
      require('chat').setup({})
    end,
  },
```
or

```lua
  {
    'benjaminyakobi/chat.nvim',
    config = function()
      require('chat').setup({ name = 'your-name' })
    end,
  },
```
