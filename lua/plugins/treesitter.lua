return {

  -- Treesitter is a new parser generator tool that we can
  -- use in Neovim to power faster and more accurate
  -- syntax highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    commit = vim.fn.has "nvim-0.12" == 0 and "7caec274fd19c12b55902a5b795100d21531391f" or nil,
    version = false, -- last release is way too old and doesn't work on Windows
    build = function()
      local TS = require "nvim-treesitter"
      if not TS.get_installed then
        LazyVim.error "Please restart Neovim and run `:TSUpdate` to use the `nvim-treesitter` **main** branch."
        return
      end
      -- make sure we're using the latest treesitter util
      -- package.loaded["lazyvim.util.treesitter"] = nil
      -- LazyVim.treesitter.build(function() TS.update(nil, { summary = true }) end)
    end,
    event = { "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    opts_extend = { "ensure_installed" },
    ---@alias lazyvim.TSFeat { enable?: boolean, disable?: string[] }
    ---@class lazyvim.TSConfig: TSConfig
    opts = {
      -- LazyVim config for treesitter
      indent = { enable = true }, ---@type lazyvim.TSFeat
      highlight = { enable = true }, ---@type lazyvim.TSFeat
      folds = { enable = true }, ---@type lazyvim.TSFeat
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
    ---@param opts lazyvim.TSConfig
    config = function(_, opts)
      local TS = require "nvim-treesitter"

      -- some quick sanity checks
      TS.setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("lazyvim_treesitter", { clear = true }),
        callback = function(ev)
          local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
          -- if not LazyVim.treesitter.have(ft) then return end

          ---@param feat string
          ---@param query string
          local function enabled(feat, query)
            local f = opts[feat] or {} ---@type lazyvim.TSFeat
            return f.enable ~= false and not (type(f.disable) == "table" and vim.tbl_contains(f.disable, lang))
            -- and LazyVim.treesitter.have(ft, query)
          end

          -- highlighting
          if enabled("highlight", "highlights") then pcall(vim.treesitter.start, ev.buf) end

          if opts.indent.enable then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
          if opts.folds and opts.folds.enable then
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        -- LazyVim extention to create buffer-local keymaps
        keys = {
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
    config = function(_, opts)
      local TS = require "nvim-treesitter-textobjects"
      if not TS.setup then
        LazyVim.error "Please use `:Lazy` and update `nvim-treesitter`"
        return
      end
      TS.setup(opts)

      local function attach(buf)
        local ft = vim.bo[buf].filetype
        if not (vim.tbl_get(opts, "move", "enable") and LazyVim.treesitter.have(ft, "textobjects")) then return end
        ---@type table<string, table<string, string>>
        local moves = vim.tbl_get(opts, "move", "keys") or {}

        for method, keymaps in pairs(moves) do
          for key, query in pairs(keymaps) do
            local queries = type(query) == "table" and query or { query }
            local parts = {}
            for _, q in ipairs(queries) do
              local part = q:gsub("@", ""):gsub("%..*", "")
              part = part:sub(1, 1):upper() .. part:sub(2)
              table.insert(parts, part)
            end
            local desc = table.concat(parts, " or ")
            desc = (key:sub(1, 1) == "[" and "Prev " or "Next ") .. desc
            desc = desc .. (key:sub(2, 2) == key:sub(2, 2):upper() and " End" or " Start")
            vim.keymap.set({ "n", "x", "o" }, key, function()
              if vim.wo.diff and key:find "[cC]" then return vim.cmd("normal! " .. key) end
              require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
            end, {
              buffer = buf,
              desc = desc,
              silent = true,
            })
          end
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("lazyvim_treesitter_textobjects", { clear = true }),
        callback = function(ev) attach(ev.buf) end,
      })
      vim.tbl_map(attach, vim.api.nvim_list_bufs())
    end,
  },

  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    opts = {},
  },
}
