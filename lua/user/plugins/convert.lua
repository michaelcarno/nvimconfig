return {
"cjodo/convert.nvim",
event = "VeryLazy",
  enabled = false,
  dependencies = {
    'MunifTanjim/nui.nvim'
  },
config = function()
-- local convert = require('convert')
    -- defaults
    -- convert.setup({
    --   keymaps = {
    --     focus_next = { "j", "<Down>", "<Tab>" },
    --     focus_prev = { "k", "<Up>", "<S-Tab>" },
    --     close = { "<Esc>", "<C-c>", 'qq' },
    --     submit = { "<CR>", "<Space>" },
    --   }
    -- })
end,
-- keys = {
--     { "<leader>Cn", "<cmd>ConvertFindNext<CR>", desc = "Find next convertable unit" },
--     { "<leader>Cc", "<cmd>ConvertFindCurrent<CR>", desc = "Find convertable unit in current line" },
--     { "<leader>Ca", "<cmd>ConvertAll<CR>", desc = "Convert all of a specified unit" },
--   },
}
