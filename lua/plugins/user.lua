-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  {
    "michaelcarno/mctheme",
    opts = { "mctheme" },
    lazy = false,
    priority = 1000,
  },
  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    enabled = false,
    opts = function(_, opts)
      -- require("resession").load()

      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = true },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the mapping part of the table
      -- opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        -- { name = "cmp_zotcite", priority = 901 },
        -- { name = "git", priority = 900 },
        { name = "luasnip", priority = 750 },
        { name = "cmdline", priority = 650 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }
      -- local lspkind_status_ok, lspkind = pcall(require, "lspkind")
      -- opts.formatting = {
      --   format = lspkind.cmp_format {
      --     mode = "text",
      --     menu = {
      --       -- codeinum = "[Codeinum]",
      --       buffer = "[Buffer]",
      --       nvim_lsp = "[LSP]",
      --       luasnip = "[LuaSnip]",
      --       nvim_lua = "[Lua]",
      --       latex_symbols = "[Latex]",
      --     },
      --   },
      -- }
    end,
  },
  {
    "RRethy/vim-illuminate",
    enabled = true,
    opts = function(_, opts) opts.delay = 500 end,
    -- config = function()
    --   -- default configuration
    --   require("illuminate").configure {
    --     -- providers: provider used to get references in the buffer, ordered by priority
    --     providers = {
    --       "lsp",
    --       "treesitter",
    --       "regex",
    --     },
    --     -- delay: delay in milliseconds
    --     delay = 250,
    --     -- filetype_overrides: filetype specific overrides.
    --     -- The keys are strings to represent the filetype while the values are tables that
    --     -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    --     filetype_overrides = {},
    --     -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    --     filetypes_denylist = {
    --       "dirbuf",
    --       "dirvish",
    --       "fugitive",
    --     },
    --     -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
    --     -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
    --     filetypes_allowlist = {},
    --     -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    --     -- See `:help mode()` for possible values
    --     modes_denylist = {},
    --     -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
    --     -- See `:help mode()` for possible values
    --     modes_allowlist = {},
    --     -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    --     -- Only applies to the 'regex' provider
    --     -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    --     providers_regex_syntax_denylist = {},
    --     -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
    --     -- Only applies to the 'regex' provider
    --     -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    --     providers_regex_syntax_allowlist = {},
    --     -- under_cursor: whether or not to illuminate under the cursor
    --     under_cursor = true,
    --     -- large_file_cutoff: number of lines at which to use large_file_config
    --     -- The `under_cursor` option is disabled when this cutoff is hit
    --     large_file_cutoff = nil,
    --     -- large_file_config: config to use for large files (based on large_file_cutoff).
    --     -- Supports the same keys passed to .configure
    --     -- If nil, vim-illuminate will be disabled for large files.
    --     large_file_overrides = nil,
    --     -- min_count_to_highlight: minimum number of matches required to perform highlighting
    --     min_count_to_highlight = 1,
    --     -- should_enable: a callback that overrides all other settings to
    --     -- enable/disable illumination. This will be called a lot so don't do
    --     -- anything expensive in it.
    --     should_enable = function(bufnr) return true end,
    --     -- case_insensitive_regex: sets regex case sensitivity
    --     case_insensitive_regex = false,
    --   }
    -- end,
  },

  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  {
    "stevearc/resession.nvim",
    -- lazy = false,
    enabled = true,
    -- config = function()
    -- require("resession").setup {
    opts = function(_, opts)
      opts = {
        -- Options for automatically saving sessions on a timer
        autosave = {
          enabled = true,
          -- How often to save (in seconds)
          interval = 30,
          -- Notify when autosaved
          notify = true,
        },
        -- Save and restore these options
        options = {
          "binary",
          "bufhidden",
          "buflisted",
          "cmdheight",
          "diff",
          "filetype",
          "modifiable",
          "previewwindow",
          "readonly",
          "scrollbind",
          "winfixheight",
          "winfixwidth",
        },
        -- Custom logic for determining if the buffer should be included
        buf_filter = require("resession").default_buf_filter,
        -- Custom logic for determining if a buffer should be included in a tab-scoped session
        tab_buf_filter = function(tabpage, bufnr) return true end,
        -- The name of the directory to store sessions in
        dir = "session",
        -- Show more detail about the sessions when selecting one to load.
        -- Disable if it causes lag.
        load_detail = true,
        -- List order ["modification_time", "creation_time", "filename"]
        load_order = "modification_time",
        -- Configuration for extensions
        extensions = {
          quickfix = {},
        },
      }
    end,
  },
}
