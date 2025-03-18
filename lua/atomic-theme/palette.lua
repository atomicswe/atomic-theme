local M = {}

M.colors = {
    -- Base colors
    bg        = "#161616", -- Rich dark background with slight blue undertone
    bg_alt    = "#1B1B1B", -- Slightly lighter background for contrast
    bg_float  = "#1e2030", -- Background for floating windows
    fg        = "#c0caf5", -- Soft blue-white foreground for primary text
    fg_alt    = "#a9b1d6", -- Slightly dimmer foreground for secondary elements

    -- UI elements
    border    = "#3b4261", -- Border color for windows
    selection = "#364a82", -- Selection highlight
    comment   = "#565f89", -- Muted blue-gray for comments
    line_nr   = "#3b4261", -- Line numbers
    cursor    = "#73daca", -- Cursor color

    -- Syntax highlighting
    keyword   = "#bb9af7", -- Lavender for keywords
    operator  = "#89ddff", -- Sky blue for operators
    func      = "#7aa2f7", -- Bright blue for functions
    string    = "#9ece6a", -- Soft green for strings
    constant  = "#ff9e64", -- Soft orange for constants
    number    = "#ff9e64", -- Using same soft orange for numbers
    type      = "#2ac3de", -- Cyan for types
    variable  = "#c0caf5", -- Default foreground for variables
    parameter = "#e0af68", -- Gold for parameters
    property  = "#ff79c6", -- Magenta for object properties

    -- Status and special
    error     = "#f7768e", -- Soft red for errors
    warning   = "#e0af68", -- Gold for warnings
    hint      = "#1abc9c", -- Teal for hints
    info      = "#0db9d7", -- Light blue for info
    added     = "#9ece6a", -- Green for git added
    modified  = "#7aa2f7", -- Blue for git modified
    removed   = "#f7768e", -- Red for git removed
}

function M.generate_variants()
    local variants = {}

    variants.bg_lighter = M.lighten(M.colors.bg, 0.1)
    variants.bg_darker = M.darken(M.colors.bg, 0.1)

    return variants
end

function M.lighten(hex, amount)
    return M.blend(hex, "#ffffff", amount)
end

function M.darken(hex, amount)
    return M.blend(hex, "#000000", amount)
end

function M.blend(foreground, background, alpha)
    local bg = {tonumber(background:sub(2, 3), 16), tonumber(background:sub(4, 5), 16), tonumber(background:sub(6, 7), 16)}
    local fg = {tonumber(foreground:sub(2, 3), 16), tonumber(foreground:sub(4, 5), 16), tonumber(foreground:sub(6, 7), 16)}

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return string.format("%02x", math.floor(math.min(math.max(0, ret), 255) + 0.5))
    end

    return string.format("#%s%s%s", blendChannel(1), blendChannel(2), blendChannel(3))
end

return M
