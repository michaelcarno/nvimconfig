return {
  {
    "Exafunction/codeium.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()

      require("codeium").setup {}
    end,

 },
  {
    -- Remove the `use` here if you're using folke/lazy.nvim.

    "Exafunction/codeium.vim",
    event = "User AstroFile",
    enabled = false,
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<c-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
      vim.keymap.set(
        "i",
        "<c-f>",
        function() return vim.fn["codeium#CycleCompletions"](1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<c-,>",
        function() return vim.fn["codeium#CycleCompletions"](-1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
      vim.keymap.set("n", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
      vim.keymap.set("n", "<Leader>u;", function()
        if vim.g.codeium_enabled == true then
          vim.cmd "CodeiumDisable"
        else
          vim.cmd "CodeiumEnable"
        end
      end, { noremap = true, desc = "Toggle Codeium active" })
    end,
  },
}
