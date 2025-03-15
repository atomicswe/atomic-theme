-- Atomic Theme
--
-- A sophisticated, eye-friendly dark theme for Neovim

local M = {}

local palette = require("atomic-theme.palette")
local config = require("atomic-theme.config")
local util = require("atomic-theme.util")

function M.load()
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.o.background = "dark"
    vim.g.colors_name = "atomic-theme"

    local colors = palette.colors
    local options = config.options

    local bg = options.transparent and "NONE" or colors.bg

    local highlights = {
        -- Editor UI
        Normal = { bg = bg, fg = colors.fg },
        NormalFloat = { bg = options.transparent and "NONE" or colors.bg_float, fg = colors.fg },
        FloatBorder = { bg = options.transparent and "NONE" or colors.bg_float, fg = colors.border },
        Cursor = { bg = colors.cursor, fg = colors.bg },
        CursorLine = { bg = colors.bg_alt },
        CursorColumn = { bg = colors.bg_alt },
        LineNr = { fg = colors.line_nr },
        CursorLineNr = { fg = colors.fg, bold = true },
        Visual = { bg = colors.selection },
        VisualNOS = { bg = colors.selection },
        Search = { bg = "#3d59a1", fg = colors.fg, bold = true },
        IncSearch = { bg = colors.selection, fg = colors.fg, bold = true },
        MatchParen = { bg = "#344b6f", bold = true },
        NonText = { fg = "#3b4261" },
        Folded = { bg = colors.bg_alt, fg = colors.comment, italic = true },
        FoldColumn = { fg = colors.comment },
        SignColumn = { bg = bg, fg = colors.fg },
        VertSplit = { fg = colors.border },
        Pmenu = { bg = colors.bg_float, fg = colors.fg },
        PmenuSel = { bg = colors.selection, fg = colors.fg },
        PmenuSbar = { bg = colors.bg_alt },
        PmenuThumb = { bg = colors.selection },
        StatusLine = { bg = colors.bg_alt, fg = colors.fg },
        StatusLineNC = { bg = colors.bg_alt, fg = colors.comment },
        TabLine = { bg = colors.bg_alt, fg = colors.comment },
        TabLineFill = { bg = bg },
        TabLineSel = { bg = bg, fg = colors.fg, bold = true },
        WildMenu = { bg = colors.bg_alt, fg = colors.fg, bold = true },
        Title = { fg = colors.func, bold = true },
        Directory = { fg = colors.func },
        SpecialKey = { fg = colors.keyword },
        MoreMsg = { fg = colors.string },
        Question = { fg = colors.string },
        WarningMsg = { fg = colors.warning, bold = true },
        ErrorMsg = { fg = colors.error, bold = true },
        ModeMsg = { fg = colors.fg, bold = true },
        SpellBad = { undercurl = true, sp = colors.error },
        SpellCap = { undercurl = true, sp = colors.warning },
        SpellRare = { undercurl = true, sp = colors.keyword },
        SpellLocal = { undercurl = true, sp = colors.info },

        -- Syntax highlighting
        Comment = { fg = colors.comment, italic = options.italic_comments },
        Constant = { fg = colors.constant },
        String = { fg = colors.string },
        Character = { fg = colors.string },
        Number = { fg = colors.number },
        Boolean = { fg = colors.constant, italic = true },
        Float = { fg = colors.number },
        Identifier = { fg = colors.variable },
        Function = { fg = colors.func, bold = options.bold_functions },
        Statement = { fg = colors.keyword },
        Conditional = { fg = colors.keyword },
        Repeat = { fg = colors.keyword },
        Label = { fg = colors.keyword },
        Operator = { fg = colors.operator },
        Keyword = { fg = colors.keyword, bold = options.bold_keywords },
        Exception = { fg = colors.keyword },
        PreProc = { fg = colors.keyword },
        Include = { fg = colors.keyword },
        Define = { fg = colors.keyword },
        Macro = { fg = colors.keyword },
        PreCondit = { fg = colors.keyword },
        Type = { fg = colors.type },
        StorageClass = { fg = colors.keyword },
        Structure = { fg = colors.type },
        Typedef = { fg = colors.type },
        Special = { fg = colors.operator },
        SpecialChar = { fg = colors.string },
        Tag = { fg = colors.keyword },
        Delimiter = { fg = colors.fg_alt },
        SpecialComment = { fg = colors.comment, bold = true },
        Debug = { fg = colors.warning },
        Underlined = { fg = colors.info, underline = true },
        Ignore = { fg = colors.comment },
        Error = { fg = colors.error, bold = true },
        Todo = { fg = colors.bg, bg = colors.warning, bold = true },

        -- Diagnostics
        DiagnosticError = { fg = colors.error },
        DiagnosticWarn = { fg = colors.warning },
        DiagnosticInfo = { fg = colors.info },
        DiagnosticHint = { fg = colors.hint },
        DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },

        -- Git highlighting
        DiffAdd = { bg = colors.diff_add },
        DiffChange = { bg = colors.diff_change },
        DiffDelete = { bg = colors.diff_delete },
        DiffText = { bg = colors.diff_text, fg = colors.fg, bold = true },
    }

    util.apply_highlights(highlights)
    util.set_terminal_colors(colors)

    if not util.is_plugin_disabled("treesitter") then
        util.apply_highlights({
            ["@keyword"] = { link = "Keyword" },
            ["@string"] = { link = "String" },
            ["@function"] = { link = "Function" },
            ["@function.call"] = { fg = colors.func },
            ["@method"] = { fg = colors.func },
            ["@method.call"] = { fg = colors.func },
            ["@constant"] = { link = "Constant" },
            ["@variable"] = { link = "Identifier" },
            ["@variable.builtin"] = { fg = colors.constant, italic = true },
            ["@property"] = { fg = colors.fg_alt },
            ["@constructor"] = { fg = colors.type },
            ["@parameter"] = { fg = colors.parameter },
            ["@namespace"] = { fg = colors.type, italic = true },
            ["@type"] = { link = "Type" },
            ["@type.builtin"] = { fg = colors.type, italic = true },
            ["@tag"] = { fg = colors.keyword },
            ["@tag.attribute"] = { fg = colors.parameter },
            ["@tag.delimiter"] = { fg = colors.delimiter },
            ["@punctuation.bracket"] = { fg = colors.fg_alt },
            ["@punctuation.delimiter"] = { fg = colors.fg_alt },
            ["@text"] = { fg = colors.fg },
            ["@text.emphasis"] = { italic = true },
            ["@text.strong"] = { bold = true },
            ["@text.title"] = { fg = colors.func, bold = true },
            ["@text.literal"] = { fg = colors.string },
            ["@comment"] = { link = "Comment" },
        })
    end

    if not util.is_plugin_disabled("telescope") then
        util.apply_highlights({
            TelescopeNormal = { bg = colors.bg_float, fg = colors.fg },
            TelescopeBorder = { bg = colors.bg_float, fg = colors.border },
            TelescopePromptBorder = { bg = colors.bg_alt, fg = colors.border },
            TelescopePromptNormal = { bg = colors.bg_alt, fg = colors.fg },
            TelescopePromptPrefix = { bg = colors.bg_alt, fg = colors.keyword },
            TelescopeSelection = { bg = colors.selection, fg = colors.fg },
            TelescopeResultsTitle = { bg = colors.bg_float, fg = colors.func, bold = true },
        })
    end

    if not util.is_plugin_disabled("nvim-tree") then
        util.apply_highlights({
            NvimTreeNormal = { bg = options.transparent and "NONE" or colors.bg_alt, fg = colors.fg },
            NvimTreeFolderName = { fg = colors.fg_alt },
            NvimTreeFolderIcon = { fg = colors.func },
            NvimTreeOpenedFolderName = { fg = colors.fg, bold = true },
            NvimTreeEmptyFolderName = { fg = colors.comment },
            NvimTreeFilename = { fg = colors.fg },
            NvimTreeSpecialFile = { fg = colors.func, bold = true },
            NvimTreeImageFile = { fg = colors.fg_alt },
            NvimTreeIndentMarker = { fg = colors.border },
            NvimTreeGitDirty = { fg = colors.modified },
            NvimTreeGitNew = { fg = colors.added },
            NvimTreeGitDeleted = { fg = colors.removed },
        })
    end

    util.apply_custom_highlights()
end

M.setup = config.setup

return M
