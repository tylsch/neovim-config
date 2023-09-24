local M = {}
M.telescope = {
  n = {
    ["<leader>tm"] = {
      "<cmd> Telescope metals commands <CR>", "Metals Commands"
    }
  }
}
M.neogit = {
  n = {
    ["<A-g>"] = {
      "<cmd> Neogit <CR>", "Open Neogit"
    }
  }
}

return M
