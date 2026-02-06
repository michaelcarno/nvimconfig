return {

  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  enabled = true,
  event = "VeryLazy",
  -- lazy = false,
  -- cmd = "Avante",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  on_setup = function()
    -- Переопределяем проверку ключа для openai-провайдера
    local openai = require "avante.providers.openai"
    openai.is_env_set = function()
      return true -- LM Studio не требует ключа
    end
  end,
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    -- for example
    mode = "legacy",
    provider = "openai",
    providers = {
      openai = {
        endpoint = "http://127.0.0.1:1234/v1",
        model = "gpt-oss-20b",
        disable_tools = true, -- disable tools!
        extra_request_body = {
          temperature = 0.75,
          num_ctx = 120480,
          max_tokens = 14096,
        },
      },
      mistalai = {
        __inherited_from = "openai",
        endpoint = "http://127.0.0.1:1234/v1",
        model = "devstral-small-2-2512",
        disable_tools = true, -- disable tools!
        extra_request_body = {
          temperature = 0.75,
          num_ctx = 120480,
          max_tokens = 14096,
        },
      },
      deepseek = {
        __inherited_from = "openai",
        endpoint = "http://127.0.0.1:1234/v1",
        model = "deepseek-coder-v2-lite-instruct",
        disable_tools = true, -- disable tools!
        extra_request_body = {
          temperature = 0.75,
          num_ctx = 12048,
          max_tokens = 14096,
        },
      },
      -- essentialai = {
      --   __inherited_from = "ollama",
      --   endpoint = "http://127.0.0.1:1234",
      --   model = "rnj-1",
      --   disable_tools = true, -- disable tools!
      --   extra_request_body = {
      --     temperature = 0.75,
      --     num_ctx = 120480,
      --     max_tokens = 14096,
      --   },
      -- },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    -- "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    -- {
    --   -- Make sure to set this up properly if you have lazy=true
    --   "MeanderingProgrammer/render-markdown.nvim",
    --   opts = {
    --     file_types = { "markdown", "Avante" },
    --   },
    --   ft = { "markdown", "Avante" },
    -- },
  },
}
