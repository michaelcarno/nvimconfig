return {
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      local augroup = vim.api.nvim_create_augroup
      local autocmd = vim.api.nvim_create_autocmd
      augroup("__formatter__", { clear = true })
      autocmd("BufWritePost", {
        group = "__formatter__",
        command = ":FormatWrite",
      })

      -- Utilities for creating configurations
      local util = require "formatter.util"

      -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
      require("formatter").setup {
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
          -- Formatter configurations for filetype "lua" go here
          -- and will be executed in order
          lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            function()
              -- Supports conditional formatting
              if util.get_current_buffer_file_name() == "special.lua" then return nil end

              -- Full specification of configurations is down below and in Vim help
              -- files
              return {
                exe = "stylua",
                args = {
                  "--search-parent-directories",
                  "--stdin-filepath",
                  util.escape_path(util.get_current_buffer_file_path()),
                  "--",
                  "-",
                },
                stdin = true,
              }
            end,
          },
          typescript = {
            -- prettierd
            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
          javascript = {
            -- prettierd
            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
          html = {
            -- prettierd
            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
          rust = {
            function()
              return {
                exe = "rustfmt",
                args = { "--edition 2021" },
                stdin = true,
              }
            end,
          },

          htmlangular = {
            -- prettierd
            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
          scss = {
            -- prettierd
            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
          css = {
            -- prettierd
            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },

          -- Use the special "*" filetype for defining formatter configurations on
          -- any filetype
          ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            -- require("formatter.filetypes.any").remove_trailing_whitespace,
            -- Remove trailing whitespace without 'sed'
            --
            require("formatter.filetypes.any").substitute_trailing_whitespace,
          },
        },
      }
    end,
    keys = {
      -- { "W", "<cmd>FormatWrite<cr>", desc ="FormatWrite" },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { "rustfmt", lsp_format = "fallback" },
          -- Conform will run the first available formatter
          json = { "fixjson", stop_after_first = true },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true, timeout_ms = 2000 },
          htmlangular = { "prettierd", stop_after_first = true, timeout_ms = 5000 },
          html = { "prettierd", "prettier", stop_after_first = true },
          css = { "prettierd", "prettier", stop_after_first = true },
          scss = { "prettierd", "prettier", stop_after_first = true },
        },
        -- format_on_save = {
        --   -- These options will be passed to conform.format()
        --   timeout_ms = 5000,
        --   lsp_format = "fallback",
        -- },
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          vim.print(vim.g.autoformat_enabled)
          if vim.g.autoformat_enabled == true then
            require("conform").format {
              bufnr = args.buf,
            }
          end
        end,
      })
    end,
    keys = {
      -- { "", function() end, desc ="" },
    },
  },
}
