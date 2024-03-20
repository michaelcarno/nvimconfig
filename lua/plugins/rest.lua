local prefix = "<leader>R"
local utils = require "astrocore"

return {
  -- {
  --   "vhyrro/luarocks.nvim",
  --   branch = "go-away-python",
  --   opts = { rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" } },
  --   config = function() require("luarocks").setup {} end,
  -- },
  {
    enabled = true,
    commit = "91badd46c60df6bd9800c809056af2d80d33da4c",
    "rest-nvim/rest.nvim",
    ft = { "http" },
    cmd = {
      "RestNvim",
      "RestNvimPreview",
      "RestNvimLast",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "luarocks.nvim",
    },

    config = function() require("rest-nvim").setup {} end,
    keys = {
      { prefix, desc = "RestNvim" },
      { prefix .. "r", "<Plug>RestNvim", desc = "Run request" },
    },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "http" })
      end
    end,
  },
}
