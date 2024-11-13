return {
  "nvim-telescope/telescope-frecency.nvim",
  event = "VeryLazy",
  config = function()

    require("telescope").setup {
      extensions = {
        frecency = {
          auto_validate = true,
          ignore_patterns = { "*/.git", "*/.git/*", "*/.DS_Store", ".angular" },
          matcher = "fuzzy",
          path_display = { "filename_first" },
          -- show_scores=true,
        },
      },
    }
    require("telescope").load_extension "frecency"
  end,
  keys = {

    {
      "fo",
      function()
        require("telescope").extensions.frecency.frecency {
          path_display = { "filename_first" },
           previewer = false,
        }
      end,
      desc = "Frecency",
    },
    {
      "fe", function()
        local frecency = require("telescope").extensions.frecency
        require("telescope.builtin").live_grep {
	        -- HACK: `search_dirs` can accept files to grep nevertheless its name
	        search_dirs = frecency.query {},
        }
      end, { desc = "Live Grep Frecency" }
    }
  },
}
