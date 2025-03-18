-- Nova Theme Color Palette
--
-- Colors are defined here to make them easy to reference and modify

local M = {}

M.colors = {
  -- Base colors
  bg        = "#1a1b26", -- Rich dark background with slight blue undertone
  bg_alt    = "#24283b", -- Slightly lighter background for contrast
  bg_float  = "#1e2030", -- Background for floating windows
  fg        = "#c0caf5", -- Soft blue-white foreground for primary text
  fg_alt    = "#a9b1d6", -- Slightly dimmer foreground for secondary elements

  -- UI elements
  border    = "#3b4261", -- Border color for windows
  selection = "#364a82", -- Selection highlight
  comment   = "#565f89", -- Muted blue-gray for comments
  line_nr   = "#3b4261", -- Line numbers
  cursor    = "#38D4A4", -- Cursor color (using teal from palette)

  -- Syntax highlighting
  keyword   = "#9F32F9", -- Brightened purple for keywords
  operator  = "#47D7FF", -- Brightened light blue for operators
  func      = "#3993FF", -- Brightened blue for functions
  string    = "#A0D620", -- Brightened olive green for strings
  constant  = "#FF9D20", -- Brightened orange for constants
  number    = "#FF9D20", -- Using same brightened orange for numbers
  type      = "#7159FF", -- Brightened indigo for types
  variable  = "#D5E8FF", -- Brightened default foreground for variables
  parameter = "#FF5DA8", -- Brightened pink for parameters
  property  = "#FF40C3", -- Brightened magenta for object properties

  -- Status and special
  error     = "#FF3939", -- Brightened red for errors
  warning   = "#FFAE30", -- Brightened orange for warnings
  hint      = "#4DFFBF", -- Brightened teal for hints
  info      = "#59DFFF", -- Brightened light blue for info
  added     = "#42FF00", -- Brightened green for git added
  modified  = "#3993FF", -- Brightened blue for git modified
  removed   = "#FF3939", -- Brightened red for git removed

  -- Diff colors
  diff_add    = "#2a3834",
  diff_change = "#26324a",
  diff_delete = "#3a2a35",
  diff_text   = "#26324a",
}

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
  local bg = {tonumber(background:sub(2, 3), 16), tonumber(background:sub(4, 5), 16), tonumber(background:sub(6, 7), 16)}
  local fg = {tonumber(foreground:sub(2, 3), 16), tonumber(foreground:sub(4, 5), 16), tonumber(foreground:sub(6, 7), 16)}

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return string.format("%02x", math.floor(math.min(math.max(0, ret), 255) + 0.5))
  end

  return string.format("#%s%s%s", blendChannel(1), blendChannel(2), blendChannel(3))
end

return M
