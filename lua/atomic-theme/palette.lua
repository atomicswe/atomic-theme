-- Atomic Theme Color Palette
--
-- A restrained palette with matching dark and light variants.

local M = {}

M.dark = {
    bg = "#1d1c21",
    bg_alt = "#28272b",
    bg_float = "#2f2f38",
    fg = "#d8dee4",
    fg_alt = "#a9b3bd",

    border = "#53525c",
    selection = "#2b4155",
    comment = "#69737d",
    line_nr = "#4a545e",
    cursor = "#f0f0f0",

    keyword = "#8ab4f8",
    operator = "#9aa4ae",
    func = "#7cc7b0",
    string = "#e6ae37",
    constant = "#d8a657",
    number = "#d8a657",
    type = "#b6a0ff",
    variable = "#d8dee4",
    parameter = "#c5ccd3",
    property = "#c5ccd3",
    delimiter = "#7f8993",

    error = "#e67e80",
    warning = "#dbb671",
    hint = "#7cc7b0",
    info = "#8ab4f8",
    added = "#9ccfd8",
    modified = "#f6c177",
    removed = "#eb6f92",

    diff_add = "#1d3438",
    diff_change = "#3a2f1f",
    diff_delete = "#3a202c",
    diff_text = "#493a24",
}

M.light = {
    bg = "#fffaf5",
    bg_alt = "#fffaf3",
    bg_float = "#fcf6f0",
    fg = "#202427",
    fg_alt = "#56616b",

    border = "#d0c9bb",
    selection = "#d7e4ee",
    comment = "#77808a",
    line_nr = "#a89f91",
    cursor = "#3d3d3d",

    keyword = "#2f6fbd",
    operator = "#68737d",
    func = "#2f8f75",
    string = "#e6ae37",
    constant = "#9a6417",
    number = "#9a6417",
    type = "#7357b8",
    variable = "#202427",
    parameter = "#3a444c",
    property = "#3a444c",
    delimiter = "#68737d",

    error = "#b34545",
    warning = "#9a6417",
    hint = "#2f8f75",
    info = "#2f6fbd",
    added = "#5b7f32",
    modified = "#2f6fbd",
    removed = "#b34545",

    diff_add = "#dfead3",
    diff_change = "#d8e7f2",
    diff_delete = "#efd8d8",
    diff_text = "#c9deed",
}

M.colors = M.dark

function M.get(style)
    if style == "light" then
        return M.light, "light"
    end

    if style == "auto" and vim.o.background == "light" then
        return M.light, "light"
    end

    return M.dark, "dark"
end

-- Create lighter/darker variations of existing colors
function M.generate_variants()
    local variants = {}

    -- Add lighter/darker variants of main colors
    -- This can be useful for hover states, etc.
    variants.bg_lighter = M.lighten(M.colors.bg, 0.1)
    variants.bg_darker = M.darken(M.colors.bg, 0.1)

    return variants
end

-- Utility functions for color manipulation
function M.lighten(hex, amount)
    return M.blend(hex, "#ffffff", amount)
end

function M.darken(hex, amount)
    return M.blend(hex, "#000000", amount)
end

function M.blend(foreground, background, alpha)
    local bg = { tonumber(background:sub(2, 3), 16), tonumber(background:sub(4, 5), 16), tonumber(background:sub(6, 7),
        16) }
    local fg = { tonumber(foreground:sub(2, 3), 16), tonumber(foreground:sub(4, 5), 16), tonumber(foreground:sub(6, 7),
        16) }

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return string.format("%02x", math.floor(math.min(math.max(0, ret), 255) + 0.5))
    end

    return string.format("#%s%s%s", blendChannel(1), blendChannel(2), blendChannel(3))
end

return M
