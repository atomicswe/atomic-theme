# Atomic Theme for Neovim

<p align="center">
  <img src="screenshots/atomic-theme-banner.png" alt="Atomic Theme" width="600">
</p>

A sophisticated, eye-friendly dark theme for Neovim with carefully balanced colors that provide excellent syntax highlighting while avoiding eye strain during long coding sessions.

## ✨ Features

- 🎨 Modern color palette with proper contrast ratios
- 🔍 Extensive highlight groups for UI elements (80+ highlight groups)
- 🔌 Rich plugin support (Treesitter, Telescope, LSP, Git, and more)
- 🧠 Semantic color coding for better code readability
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
    transparent = false,       -- Use transparent background
    italic_comments = true,    -- Make comments italic
    bold_keywords = true,      -- Make keywords bold
    bold_functions = false,    -- Make function names bold
    dim_inactive_windows = false, -- Dim inactive windows
    disable_plugins = {},      -- Disable specific plugin highlights
    custom_highlights = {},    -- User-defined highlight overrides
})
```

Example with custom highlights:

```lua
require('atomic-theme').setup({
    bold_keywords = false,
    custom_highlights = {
        Comment = { fg = "#676e95", italic = true },
        Keyword = { fg = "#c792ea" },
    }
})
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
