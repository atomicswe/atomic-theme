local M = {}

local defaults = {
  style = "auto",
  transparent = false,
  italic_comments = false,
  bold_keywords = false,
  bold_functions = false,
  dim_inactive_windows = false,
  custom_highlights = {},
  disable_plugins = {},
}

M.options = vim.deepcopy(defaults)

function M.setup(opts)
  opts = opts or {}
  M.options = vim.tbl_deep_extend("force", M.options, opts)

  if vim.g.colors_name == "atomic-theme" then
    require("atomic-theme").load()
  end
end

function M.reset()
  M.options = vim.deepcopy(defaults)
  if vim.g.colors_name == "atomic-theme" then
    require("atomic-theme").load()
  end
end

return M
