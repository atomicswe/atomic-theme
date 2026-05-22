# Atomic Theme for Neovim

<p align="center">
  <img src="screenshots/atomic-theme-banner.png" alt="Atomic Theme" width="600">
</p>

Atomic is a restrained Neovim theme with matching dark and light modes. It keeps the syntax palette small so code reads cleanly instead of looking like a fruit salad.

## ✨ Features

- 🎨 Calm dark and light palettes
- 🔍 Extensive highlight groups for UI elements (80+ highlight groups)
- 🔌 Rich plugin support (Treesitter, Telescope, LSP, Git, and more)
- 🧠 Small semantic color set for better code readability
- 🎛️ Customizable options to match your preferences

## 📸 Screenshots

<details>
<summary>Click to expand screenshots</summary>

*Add screenshots of the theme with different languages and plugins*

</details>

## 📦 Installation

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'atomicswe/atomic-theme',
    config = function()
        -- Optional configuration
        require('atomic-theme').setup({
            -- options
        })
        
        -- Load the colorscheme
        vim.cmd('colorscheme atomic-theme')
    end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'atomicswe/atomic-theme'
```

Then add to your init.vim/init.lua:

```vim
" Optional configuration
lua require('atomic-theme').setup({ 
    -- options 
})

colorscheme atomic-theme
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    'atomicswe/atomic-theme',
    priority = 1000,
    config = function()
        require('atomic-theme').setup({
            -- options
        })
        vim.cmd.colorscheme 'atomic-theme'
    end,
}
```

## ⚙️ Configuration

Atomic theme comes with several configuration options:

```lua
require('atomic-theme').setup({
    style = "auto",            -- "auto", "dark", or "light"
    transparent = false,       -- Use transparent background
    italic_comments = false,   -- Make comments italic
    bold_keywords = false,     -- Make keywords bold
    bold_functions = false,    -- Make function names bold
    dim_inactive_windows = false, -- Dim inactive windows
    disable_plugins = {},      -- Disable specific plugin highlights
    custom_highlights = {},    -- User-defined highlight overrides
})
```

`style = "auto"` follows `vim.o.background`. Use `style = "dark"` or `style = "light"` to force a mode.

Example with custom highlights:

```lua
require('atomic-theme').setup({
    bold_keywords = false,
    custom_highlights = {
        Comment = { fg = "#77808a" },
        Keyword = { fg = "#2f6fbd" },
    }
})
```

## 🧪 Local Testing

From this repository:

```sh
nvim --clean --cmd 'set rtp+=.'
```

Then in Neovim:

```vim
:colorscheme atomic-theme
:lua require("atomic-theme").setup({ style = "light" })
:lua require("atomic-theme").setup({ style = "dark" })
```

Headless smoke test:

```sh
nvim --headless -u NONE --cmd 'set rtp+=.' -c 'colorscheme atomic-theme' -c 'lua require("atomic-theme").setup({ style = "light" })' -c 'lua require("atomic-theme").setup({ style = "dark" })' -c 'qa'
```

## 🔌 Supported Plugins

Atomic theme provides specialized highlighting for these plugins:

- Treesitter
- Telescope
- NvimTree
- LSP
- Git signs
- Diagnostic
- Indent Blankline
- Notify
- Bufferline
- Dashboard

You can disable specific plugin highlighting:

```lua
require('atomic-theme').setup({
    disable_plugins = { "bufferline", "telescope" }
})
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/atomicswe">atomicswe</a>
</p>
