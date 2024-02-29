return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      black = "#282828",
      white_fff = "#dddddd",
      white = "#bbbbbb",
      red = "#fb4934",
      green = "#b8bb26",
      yellow = "#ffff00",
      blue = "#234779",
      -- yellow = "#fe8019",
      gray = "#a89984",
      -- purple = "#c678dd",
      purple = "#590099",
      darkgray = "#3c3836",
      lightgray = "#504945",
      inactivegray = "#7c6f64",
      normalBf = "#234779",
      insertBg = "#B60101",
      visualBg = "#FcFF00",
      replaceBg = "#B60101",
      commandBg = "#990099",
      inactiveBg = "",
    }
    local branchDiffDiagnostic = { fg = colors.white_fff, bg = colors.purple, gui = "bold" }
    local custom_theme = require "lualine.themes.ayu_dark"
    custom_theme = {
      normal = {
        a = { bg = colors.normalBf, fg = colors.white, gui = "bold" },
        b = branchDiffDiagnostic,
        c = { fg = colors.white, gui = "bold" },
        y = { fg = colors.white, gui = "bold" },
        z = { bg = colors.normalBf, fg = colors.white_fff, gui = "bold" },
      },
      insert = {
        a = { bg = colors.insertBg, fg = colors.white, gui = "bold" },
        b = branchDiffDiagnostic,
        c = { fg = colors.white, gui = "bold" },
        y = { fg = colors.white, gui = "bold" },
        z = { bg = colors.insertBg, fg = colors.white, gui = "bold" },
      },
      visual = {
        a = { bg = colors.visualBg, fg = colors.black, gui = "bold" },
        b = branchDiffDiagnostic,
        c = { fg = colors.white, gui = "bold" },
        y = { fg = colors.white, gui = "bold" },
        z = { bg = colors.visualBg, fg = colors.black, gui = "bold" },
      },
      replace = {
        a = { bg = colors.replaceBg, fg = colors.white, gui = "bold" },
        b = branchDiffDiagnostic,
        c = { fg = colors.white, gui = "bold" },
        y = { fg = colors.white, gui = "bold" },
        z = { bg = colors.replaceBg, fg = colors.white, gui = "bold" },
      },
      command = {
        a = { bg = colors.commandBg, fg = colors.white, gui = "bold" },
        b = branchDiffDiagnostic,
        c = { fg = colors.white, gui = "bold" },
        y = { fg = colors.white, gui = "bold" },
        z = { bg = colors.commandBg, fg = colors.white, gui = "bold" },
      },
      inactive = {
        a = { fg = colors.black, gui = "bold" },
        b = { fg = colors.black, gui = "bold" },
        y = { fg = colors.white, gui = "bold" },
        c = { fg = colors.white, gui = "bold" },
        z = { fg = colors.white, gui = "bold" },
      },
    }
    require("lualine").setup {
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
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename", "diff", "diagnostics" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = { "branch" },
        lualine_c = { "filename", "diff", "diagnostics" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
  keys = {
    -- { "", function() end, desc ="" },
  },
}
