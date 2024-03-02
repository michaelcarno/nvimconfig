-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- vim options can be configured here
    options = {
      opt = {
        -- set to true or false etc.
        laststatus = 2,
        -- title = true,
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        showtabline = 0, -- always display tabline
        scrolloff = 10, -- Number of lines to keep above and below the cursor
        foldenable = true, -- enable fold for nvim-ufo
        foldlevel = 99, -- set high foldlevel for nvim-ufo
        foldlevelstart = 99, -- start with all code unfolded
        foldcolumn = "0", -- vim.fn.has "nvim-0.9" == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
        fillchars = { eob = "~" }, -- disable `~` on nonexistent lines
        cmdheight = 1, -- hide command line unless needed
        pumheight = 10, -- maximum items in popup menu
      },
      -- g = {
      --   highlighturl_enabled = false, -- highlight URLs by default
      --   mapleader = " ", -- sets vim.g.mapleader
      --   autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      --   cmp_enabled = true, -- enable completion at start
      --   autopairs_enabled = true, -- enable autopairs at start
      --   diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
      --   icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      --   ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      --   inlay_hints_enabled = true, -- enable or disable LSP inlay hints on startup (Neovim v0.10 only)
      --   semantic_tokens_enabled = true, -- enable or disable LSP semantic tokens on startup
      -- },
      -- opt = { -- vim.opt.<key>
      --   relativenumber = true, -- sets vim.opt.relativenumber
      --   number = true, -- sets vim.opt.number
      --   spell = false, -- sets vim.opt.spell
      --   signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      --   wrap = false, -- sets vim.opt.wrap
      -- },
      -- g = { -- vim.g.<key>
      --   -- configure global vim variables (vim.g)
      --   -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
      --   -- This can be found in the `lua/lazy_setup.lua` file
      -- },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        ["<leader>h"] = false, -- remove home screen hotkey
        ["gh"] = { "_", desc = "First symbols of current line" },
        ["go"] = { "$", desc = "Last symbol of line" },
        -- ["<M-w>"]      = { "g%", desc = "Go to close parent" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
        ["F2"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
        -- version b4 fix
        -- ["<leader>lG"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search symbol globaly" },
        ["<leader>gm"] = {
          "<cmd>Gitsigns toggle_current_line_blame<cr>",
          desc = "Toggle current line blame for all lines",
        },
        ["<leader>bC"] = { "<cmd>%bd<cr>", desc = "Close all buffer" },
        ["<leader>ft"] = { "<cmd>Trouble<cr>", desc = "Find trouble" },
        ["<leader>tm"] = {
          function() require("astrocore").toggle_term_cmd "btm --enable_gpu_memory" end,
          desc = "ToggleTerm btm",
        },
        ["<leader>fT"] = {
          function() require("telescope.builtin").colorscheme { enable_preview = true } end,
          desc = "Find themes",
        },

        ["g<C-d>"] = { "<C-w><C-]>", desc = "Go to definition in new window" },
        ["<C-w>d"] = { "<C-w><C-]>", desc = "Go to definition in new window" },
        ["<C-w><C-d>"] = { "<C-w><C-]>", desc = "Go to definition in new window" },
        -- ["<leader>R"]   = { "<Plug>RestNvim", desc = "Run RestRequest" },
        -- ["<leader>gm"] = { "<cmd>Himalaya bondarenkoma<cr>", desc = "Check email bondarenkoma" },
        -- ["<C-k>"]      = { function()
        --   require('lsp_signature').toggle_float_win()
        -- end, desc = "Toggle signature" },
        --
        ["<C-S-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<C-S-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },

        ["<C-S-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<C-S-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
        ["f;"] = { "<cmd>Telescope command_history<CR>", desc = "Telescoper command history" },
        ["fq"] = { "<cmd>Telescope search_history<CR>", desc = "Telescoper search history" },
        ["fj"] = { "<cmd>Telescope jumplist<CR>", desc = "Telescoper jumplist" },
        ["ff"] = {
          function() require("telescope.builtin").find_files { hidden = true, no_ignore = false } end,
          desc = "Telescoper find files",
        },
        ["fo"] = { "<cmd>Oil<cr>", desc = "Oil" },
        ["fg"] = { "<cmd>Telescope live_grep_args<CR>", desc = "Telescoper find with grep" },
        ["fF"] = {
          function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
          desc = "Find all files",
        },
        ["fb"] = {
          function() require("telescope.builtin").buffers { hidden = true, no_ignore = true } end,
          desc = "Find buffers",
        },
        ["<M-w>"] = { "%", desc = "Go to close parent" },
        ["gD"] = { "<cmd>Glance definitions<cr>", desc = "go to definition" },
        ["gR"] = { "<cmd>Glance references<cr>", desc = "go to references" },
        ["gY"] = { "<cmd>Glance type_definitions<cr>", desc = "go to type definitions" },
        ["gM"] = { "<cmd>Glance implementations<cr>", desc = "go to implementations" },
        ["<C-q>"] = false,
      },
      v = {
        ["<M-w>"] = { "%", desc = "Go to close parent" },
      },
      t = {
        -- setting a mapping to false will disable it
        ["<Esc>"] = { "<Esc>" },
        ["<C-s>"] = { "<C-\\><C-n>", desc = "Normal mode" },
      },
      i = {
        -- ["<Tab>"] = cmp.mapping.confirm {
        --   behavior = cmp.ConfirmBehavior.Insert,
        --   select = true,
        -- },

        ["<C-s>"] = { "<c-c><c-s>" },
        ["<C-l>"] = { function() require("luasnip").jump(1) end },
        ["<C-j>"] = { function() require("luasnip").jump(-1) end },

        ["<M-j>"] = { "<Down>" },
        ["<M-h>"] = { "<Left>" },
        ["<M-l>"] = { "<Right>" },
        ["<M-k>"] = { "<Up>" },
      },
      -- -- first key is the mode
      -- n = {
      --   -- second key is the lefthand side of the map
      --
      --   -- navigate buffer tabs with `H` and `L`
      --   -- L = {
      --   --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      --   --   desc = "Next buffer",
      --   -- },
      --   -- H = {
      --   --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      --   --   desc = "Previous buffer",
      --   -- },
      --
      --   -- mappings seen under group name "Buffer"
      --   ["<Leader>bD"] = {
      --     function()
      --       require("astroui.status.heirline").buffer_picker(
      --         function(bufnr) require("astrocore.buffer").close(bufnr) end
      --       )
      --     end,
      --     desc = "Pick to close",
      --   },
      --   -- tables with just a `desc` key will be registered with which-key if it's installed
      --   -- this is useful for naming menus
      --   ["<Leader>b"] = { desc = "Buffers" },
      --   -- quick save
      --   -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      -- },
      -- t = {
      --   -- setting a mapping to false will disable it
      --   -- ["<esc>"] = false,
      -- },
    },
  },
}
