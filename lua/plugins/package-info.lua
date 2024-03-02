return {
  "vuki656/package-info.nvim",
  -- enabled = false,
  event = "VeryLazy",
  dependency = {
    "MunifTanjim/nui.nvim",
    -- "nvim-lualine/lualine.nvim",
  },
  config = function()
    local conf = require "package-info"
    conf.setup {
      -- COLORS CHENGED IN THEME
      -- colors = {
      --   up_to_date = "#00FF00", -- Text color for up to date dependency virtual text
      --   outdated = "#d19a66", -- Text color for outdated dependency virtual text
      -- },
      icons = {
        enable = true, -- Whether to display icons
        style = {
          up_to_date = "      ", -- Icon for up to date dependencies
          -- up_to_date = "   ", -- Icon for up to date dependencies
          outdated = "      ", -- Icon for outdated dependencies
        },
      },
      autostart = false, -- Whether to autostart when `package.json` is opened
      hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
      hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
      -- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
      --     -- The plugin will try to auto-detect the package manager based on
      --         -- `yarn.lock` or `package-lock.json`. If none are found it will use the
      --             -- provided one, if nothing is provided it will use `yarn`
      --
      -- package_manager = "npm",
    }

    -- require("telescope").setup {
    --   extensions = {
    --     package_info = {
    --       -- Optional theme (the extension doesn't set a default theme)
    --       -- theme = "ivy",
    --     },
    --   },
    -- }

    require("telescope").load_extension "package_info"
    -- local lualine = require "lualine"
    -- local lualine_config = lualine.get_config()
    -- table.insert(lualine_config.sections.lualine_x, 1, conf.get_status())
    -- lualine.setup(lualine_config)
  end,

  keys = {

    { "<leader>fp", "<cmd>Telescope package_info<cr>", desc = "Show package info" },
    -- { "<leader>u[s", function() require("package-info").show() end, desc = "Show updates" },
    -- { "<leader>u[f", function() require("package-info").show { force = true } end, desc = "Show updates(force)" },
    -- { "<leader>u[d", function() require("package-info").delete() end, desc = "Delete package" },
    -- { "<leader>u[i", function() require("package-info").install() end, desc = "Install package" },
  },
}
