return {
  "nvim-lualine/lualine.nvim",
  -- event = "VeryLazy",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
  config = function()
    local colors = {
      black = "#000000",
      transparent = "",
      white_fff = "#dddddd",
      white = "#bbbbbb",
      red = "#fb4934",
      green = "#b8bb26",
      yellow = "#ffff00",
      blue = "#234779",
      orange = "#fe8019",
      gray = "#a89984",
      -- purple = "#c678dd",
      purple = "#590099",
      darkgray = "#3c3836",
      lightgray = "#504945",
      inactivegray = "#7c6f64",
      normalBf = "#234779",
      insertBg = "#B60101",
      visualBg = "#cccc00",
      replaceBg = "#B60101",
      commandBg = "#990099",
      modified = "#FFff00",
      -- nottoched = "#33aa88",
      nottoched = "#98c379",
      -- nottoched = "#b8cc52",
      inactiveBg = "",
    }
    local branch = { fg = colors.white_fff, bg = colors.purple, gui = "bold" }

    -- local custom_theme = require "lualine.themes.ayu_dark"
    -- local gps = require "nvim-navic"
    local custom_theme = {
      normal = {
        a = { bg = colors.normalBf, fg = colors.white, gui = "bold" },
        b = branch,
        c = function(section)
          return {
            fg = vim.bo.modified and colors.modified or colors.nottoched,
            bg = colors.transparent,
          }
        end,

        -- x = { fg = colors. },
        -- c = { fg = colors.white, gui = "bold" },
        y = { fg = colors.white, bg = colors.normalBf, gui = "bold" },
        z = { bg = colors.normalBf, fg = colors.white_fff, gui = "bold" },
      },
      insert = {
        a = { bg = colors.insertBg, fg = colors.white, gui = "bold" },
        b = branch,
        c = function(section)
          return {
            fg = vim.bo.modified and colors.modified or colors.nottoched,
            bg = colors.transparent,
          }
        end,

        y = { fg = colors.white, bg = colors.insertBg, gui = "bold" },
        z = { bg = colors.insertBg, fg = colors.white, gui = "bold" },
      },
      visual = {
        a = { bg = colors.visualBg, fg = colors.black, gui = "bold" },
        b = branch,
        c = function(section)
          return {
            fg = vim.bo.modified and colors.modified or colors.nottoched,
            bg = colors.transparent,
          }
        end,
        y = { bg = colors.visualBg, fg = colors.black, gui = "bold" },
        z = { bg = colors.visualBg, fg = colors.black, gui = "bold" },
      },
      replace = {
        a = { bg = colors.replaceBg, fg = colors.white, gui = "bold" },
        b = branch,
        c = function(section)
          return {
            fg = vim.bo.modified and colors.modified or colors.nottoched,
            bg = colors.transparent,
          }
        end,
        y = { fg = colors.black, gui = "bold" },
        z = { bg = colors.replaceBg, fg = colors.white, gui = "bold" },
      },
      command = {
        a = { bg = colors.commandBg, fg = colors.white, gui = "bold" },
        b = branch,
        c = function(section)
          return {
            fg = vim.bo.modified and colors.modified or colors.nottoched,
            bg = colors.transparent,
          }
        end,
        y = { bg = colors.commandBg, fg = colors.white, gui = "bold" },
        z = { bg = colors.commandBg, fg = colors.white, gui = "bold" },
      },
      inactive = {
        a = { fg = colors.black, gui = "bold" },
        b = branch,
        y = { fg = colors.black, gui = "bold" },
        c = function(section)
          return {
            fg = vim.bo.modified and colors.modified or colors.nottoched,
            bg = colors.transparent,
          }
        end,
        z = { fg = colors.white, gui = "bold" },
      },
    }
    -- ⟩
    local breadcrump_sep = " ⟩ "
    local config = {
      options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = {
          -- left = "",
          -- right = "",
        },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        -- remove if matchup update
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {

          { "filetype", colored = true, icon_only = true },
          {
            "filename",
            path = 0,
            file_status = true,

            symbols = {
              modified = " ●", -- Text to show when the buffer is modified
              alternate_file = "#", -- Text to show to identify the alternate file
              directory = "", -- Text to show when the buffer is a directory
              -- newfile = "[newfile]",
              readonly = "[Read Only]",
            },
          },
          "diff",
          "diagnostics",
          "searchcount",
        },
        lualine_x = {
          "encoding",
          {
            "fileformat",
            symbols = {
              -- unix = "", -- e712
              -- dos = "", -- e70f
              -- mac = "", -- e711
              -- -- symbols = {
              unix = "[unix]", -- e712
              dos = "[dos]", -- e70f
              mac = "[mac]", -- e711
            },
          },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = { "branch" },
        lualine_c = {
          { "filetype", colored = true, icon_only = true, padding = 1 },
          {
            "filename",
            path = 0,
            file_status = true,

            symbols = {
              modified = " ●", -- Text to show when the buffer is modified
              alternate_file = "#", -- Text to show to identify the alternate file
              directory = "", -- Text to show when the buffer is a directory
            },
          },
          "diff",
          "diagnostics",
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            -- file_status = true, -- displays file status (readonly status, modified status)
            path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
            -- path = 4, -- 0 = just filename, 1 = relative path, 2 = absolute path
            shorting_target = 0, -- Shortens path to leave 40 spaces in the window
            separator = vim.trim(breadcrump_sep),
            symbols = {
              modified = " ●", -- Text to show when the buffer is modified
              alternate_file = "#", -- Text to show to identify the alternate file
              directory = "", -- Text to show when the buffer is a directory
              -- newfile = "[newfile]",
              readonly = "[Read Only]",
            },
            fmt = function(str)
              local path_separator = package.config:sub(1, 1)
              return str:gsub(path_separator, breadcrump_sep)
            end,
          },
          -- {
          --   "aerial", sep= breadcrump_sep
          -- }
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {

        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            separator = vim.trim(breadcrump_sep),
            path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
            -- path = 4, -- 0 = just filename, 1 = relative path, 2 = absolute path
            shorting_target = 0, -- Shortens path to leave 40 spaces in the window

            fmt = function(str)
              local path_separator = package.config:sub(1, 1)
              return str:gsub(path_separator, breadcrump_sep)
            end,
            symbols = {
              modified = " ●", -- Text to show when the buffer is modified
              alternate_file = "#", -- Text to show to identify the alternate file
              directory = "", -- Text to show when the buffer is a directory
              -- newfile = "[newfile]",
              readonly = "[RO]",
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {
        "quickfix",
        "oil",
        "nvim-dap-ui",
        "mason",
        "fzf",
        "aerial",
        "symbols-outline",
        "toggleterm",
        "trouble",
        -- "neo-tree",
      },
    }

    -- Вставляем в секцию С информацию о lsp
    --
    -- Inserts a component in lualine_c at left section
    local function ins_left(component) table.insert(config.sections.lualine_c, component) end

    -- Inserts a component in lualine_x ot right section
    local function ins_right(component) table.insert(config.sections.lualine_x, 1, component) end

    local function ins_rightWinbar(component) table.insert(config.winbar.lualine_x, 0, component) end

    ins_right {
      "lsp_progress",
      -- display_components = { "lsp_client_name", { "title", "percentage", "message" } },
      -- With spinner
      -- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
      colors = {
        percentage = colors.cyan,
        title = colors.cyan,
        message = colors.cyan,
        spinner = colors.white,
        lsp_client_name = colors.magenta,
        use = true,
      },
      separators = {
        component = " ",
        progress = " | ",
        percentage = { pre = "", post = "%% " },
        title = { pre = "", post = ": " },
        lsp_client_name = {
          pre = "",
          post = "",
        },
        spinner = { pre = "", post = "" },
        message = {
          pre = "(",
          post = ")",
          commenced = "",
          completed = "Done",
        },
      },
      display_components = {
        "lsp_client_name",
        -- "spinner",
        {
          "percentage",
          -- "title",
          -- "message",
        },
      },
      -- lsp_client_name_enddelay = (-1 = show always)
      timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
      -- { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
      -- { "▁", "▃", "▄", "▅", "▆", "▇", "█" },
      -- { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
      spinner_symbols = { "⢎⡰", "⢎⡡", "⢎⡑", "⢎⠱", "⠎⡱", "⢊⡱", "⢌⡱", "⢆⡱" },
    }

    config.winbar = {}
    config.inactive_winbar = {}
    require("lualine").setup(config)
  end,
  keys = {
    -- { "", function() end, desc ="" },
  },
}
