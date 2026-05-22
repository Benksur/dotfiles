require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local dap = require "dap"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })

map("n", "<leader>dr", function()
  dap.continue()
end, { desc = "Debug: Continue" })

map("n", "<leader>ds", function()
  require("dap").terminate()
end, { desc = "Debug: Stop" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
