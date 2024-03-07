return {
  "shellRaining/hlchunk.nvim",
  event = "UIEnter",
  config = function()
    require("hlchunk").setup {
      chunk = {
        enable = true,
        notify = true,
        use_treesitter = true,
        -- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
        -- support_filetypes = ft.support_filetypes,
        -- exclude_filetypes = ft.exclude_filetypes,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        style = {
          { fg = "#806d9c" },
          { fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = true,
      },

      context = {
        enable = false,
        chars = { "n" },
        use_treesitter = false,
        -- support_filetypes = ft.support_filetypes,
        -- exclude_filetypes = ft.exclude_filetypes,
      },
      indent = {
        enable = false,
        use_treesitter = false,
        chars = {
          "│",
        },
        style = {
          { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui") },
        },
      },

      line_num = {
        enable = false,
        use_treesitter = false,
        style = "#806d9c",
      },

      blank = {
        enable = false,
        use_treesitter = false,
        chars = {
          "․",
        },
        style = {
          vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui"),
        },
      },
    }
  end,
  keys = {
    { "<leader>uke", "<cmd>EnableHLChunk<cr>", desc = "Enable HLChunk" },
    { "<leader>ukd", "<cmd>DisableHLChunk<cr>", desc = "Disable HLChunk" },
    -- { "<leader>ukd", "<cmd>DisableHLChunk<cr>", desc = "Disable HLChunk"}
  },
}
