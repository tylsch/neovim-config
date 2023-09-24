local M = {}

M.keys = {
  {
    "<A-g>",
    function()
      require("neogit").open()
    end,
    "n",
    desc = "Open Neogit",
  },
}
return M
