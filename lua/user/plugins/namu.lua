return {
  "bassamsdata/namu.nvim",
  event = "VeryLazy",
  enabled = false,
  config = function()
    require("namu").setup {
      -- Enable the modules you want
      namu_symbols = {

        enable = true,
        ---@type NamuConfig
        options = {
          AllowKinds = {
            default = {
              "Function",
              "Method",
              "Class",
              "Module",
              "Property",
              "Variable",
              "Constant",
              "Enum",
              "Interface",
              "Field",
              "Struct",
            },
          },
          row_position = "bottom",
          windows = {
            title_prefix = ": ",
          },

          movement = {
            next = { "<C-j>", "<DOWN>" }, -- Support multiple keys
            previous = { "<C-k>", "<UP>" }, -- Support multiple keys
            close = { "<c-c>" }, -- close mapping
            select = { "<CR>" }, -- select mapping
            delete_word = { "<c-h>" }, -- delete word mapping
            clear_line = { "<c-w>" }, -- clear line mapping
          },
          multiselect = {
            enabled = true,
            -- indicator = "●", -- or "✓"◉
            keymaps = {
              toggle = "<Tab>",
              select_all = "<C-a>",
              clear_all = "<C-l>",
              untoggle = "<S-Tab>",
            },
            max_items = nil, -- No limit by default
          },
          custom_keymaps = {
            yank = {
              keys = { "<C-y>" }, -- yank symbol text
            },
            delete = {
              keys = { "<C-d>" }, -- delete symbol text
            },
            vertical_split = {
              keys = { "<C-v>" }, -- open in vertical split
            },
            horizontal_split = {
              keys = { "" }, -- open in horizontal split
            },
            codecompanion = {
              keys = "<C-o>", -- Add symbols to CodeCompanion
            },
            avante = {
              keys = "<C-t>", -- Add symbol to Avante
            },
          },
        }, -- here you can configure namu
      },
      -- Optional: Enable other modules if needed
      ui_select = { enable = false }, -- vim.ui.select() wrapper
      colorscheme = {
        enable = false,
        options = {
          -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
          persist = true, -- very efficient mechanism to Remember selected colorscheme
          write_shada = false, -- If you open multiple nvim instances, then probably you need to enable this
        },
      },
    }
    -- === Suggested Keymaps: ===
    -- vim.keymap.set("n", "<leader>ss", ":Namu symbols<cr>", {
    --   desc = "Jump to LSP symbol",
    --   silent = true,
    -- })
    -- vim.keymap.set("n", "<leader>th", ":Namu colorscheme<cr>", {
    --   desc = "Colorscheme Picker",
    --   silent = true,
    -- })
  end,
  keys = {
    { "fa", "<cmd>Namu symbols<cr>", desc = "Namu outline" },
  },
}
