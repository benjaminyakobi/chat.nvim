# chat.nvim
NeoVim AI Plugin inspired by ThePrimeagen/99

## Installation
Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Basic setup:
```lua
  {
    'benjaminyakobi/chat.nvim',
    config = function()
      require('chat').setup({})
    end,
  },
```
Local dev setup:

```lua
  {
    'benjaminyakobi/chat.nvim',
    config = function()
      require('chat').setup({ dev = true })
    end,
  },
```
