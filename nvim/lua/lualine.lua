local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

---------------
-- lualine_a --
---------------
local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

---------------
-- lualine_b --
---------------
local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

---------------
-- lualine_c --
---------------

---------------
-- lualine_x --
---------------
local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local spaces = function()
  return "spaces: " .. vim.api.vim_buf_get_option(0, "shiftwidth")
end

local filetype = {
  "filetype",
  icons_enabled = true,
  -- icon = nil,
}

---------------
-- lualine_y --
---------------
local location = {
  "location",
  padding = 0,
}

---------------
-- lualine_z --
---------------
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

-----------
-- setup --
-----------
lualine.setup({
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
    theme = "everforest",
  },
  sections = {
    lualine_a = { branch, diagnostics },
    lualine_b = { mode },
    lualine_c = {},
    lualine_x = { diff, spaces, filetype },
    lualine_y = { location, word_count, page_count },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
