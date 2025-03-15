local M = {}

function M.highlight(group, opts)
  opts.default = opts.default or false
  vim.api.nvim_set_hl(0, group, opts)
end

function M.apply_highlights(highlights)
  for group, opts in pairs(highlights) do
    M.highlight(group, opts)
  end
end

function M.set_terminal_colors(colors)
  vim.g.terminal_color_0  = colors.bg_alt
  vim.g.terminal_color_1  = colors.error
  vim.g.terminal_color_2  = colors.string
  vim.g.terminal_color_3  = colors.warning
  vim.g.terminal_color_4  = colors.func
  vim.g.terminal_color_5  = colors.keyword
  vim.g.terminal_color_6  = colors.type
  vim.g.terminal_color_7  = colors.fg_alt
  vim.g.terminal_color_8  = colors.comment
  vim.g.terminal_color_9  = colors.error
  vim.g.terminal_color_10 = colors.string
  vim.g.terminal_color_11 = colors.warning
  vim.g.terminal_color_12 = colors.func
  vim.g.terminal_color_13 = colors.keyword
  vim.g.terminal_color_14 = colors.type
  vim.g.terminal_color_15 = colors.fg
end

function M.is_plugin_disabled(plugin)
  local disabled_plugins = require("atomic-theme.config").options.disable_plugins
  return vim.tbl_contains(disabled_plugins, plugin)
end

function M.apply_custom_highlights()
  local custom_highlights = require("atomic-theme.config").options.custom_highlights
  M.apply_highlights(custom_highlights)
end

return M
