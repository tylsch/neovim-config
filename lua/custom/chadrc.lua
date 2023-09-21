---@type ChadrcConfig
local M = {}

M.ui = {
  statusline = {
    theme = "default"
  },
  theme = 'gruvbox' 
}
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'
return M
