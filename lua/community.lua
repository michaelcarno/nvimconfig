-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- TODO: Remove branch v4 on release
  { "AstroNvim/astrocommunity", branch = "v4" },
  -- { import = "astrocommunity.pack.lua" },

  -- { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.syntax.vim-easy-align" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  -- { import = "astrocommunity.search.nvim-hlslens" },
  { import = "astrocommunity.syntax.vim-cool" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
  { import = "astrocommunity.utility.nvim-toggler" },
  -- { import = "astrocommunity.utility.noice-nvim" },
  -- { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.lsp.delimited-nvim" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  -- { import = "astrocommunity.note-taking.obsidian-nvim" },
  -- { import = "astrocommunity.debugging.telescope-dap-nvim" },

  -- import/override with your plugins folder
}
