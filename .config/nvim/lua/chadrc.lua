-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local options = {}

options.ui = {
  nvdash = {
    load_on_startup = true
  },
  statusline = {
    separator_style = "default"
  }
}

options.base46 = {
	theme = "catppuccin",
	hl_override = {
    Normal = { bg = 'NONE' },
  },
}

return options

