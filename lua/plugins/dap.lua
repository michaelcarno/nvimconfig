return {
  "mfussenegger/nvim-dap",
  enabled = true, --vim.fn.has "win32" == 0,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = { automatic_setup = true },
      -- tag = "v2.0.1",
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      
    },
  },
  event = "User AstroFile",
}
