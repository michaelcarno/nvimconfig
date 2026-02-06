return {
  "David-Kunz/gen.nvim",
  event = "VeryLazy",
  -- cmd = "Gen",
  -- lazy = false,
  enabled = false,
  config = function()
    require("gen").setup {
      model = "gpt-oss-20b", -- The default model to use.
      quit_map = "q", -- set keymap to close the response window
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
      host = "127.0.0.1", -- The host running the Ollama service.
      port = "1234", -- The port on which the Ollama service is listening.
      display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
      show_prompt = true, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
      show_model = true, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      file = false, -- Write the payload to a temporary file to keep the command short.
      hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
      init = function(options) end,
      -- Function to initialize Ollama

      command = function(options)
        local prompt = options.prompt:gsub('"', '\\"') -- экранируем кавычки
        local body = string.format(
          [[ { \"model\": \"%s\", \"messages\": [ {\"role\": \"user\", \"content\": \"%s\"} ],\"stream\": true } ]],
          options.model,
          prompt
        )
        -- return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/v1/chat -d $body"
        vim.print(body)
        -- body = vim.json.encode(body)
        -- body = string.gsub(body, '"', '\\"')

        req = string.format(
          "curl  http://%s:%s/v1/chat/completions " .. '-H "Content-Type: application/json" ' .. '-d "%s"',
          options.host,
          options.port,
          body
        )
        vim.print(req)
        return req
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is, optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      json_response = true,
      -- display_mode = "float",
      -- no_auto_close = false,
      -- init = function() pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
      list_models = function(options)
        local handle = io.popen(string.format("curl -s http://%s:%s/v1/models", options.host, options.port))
        if not handle then return {} end
        local result = handle:read "*a"
        handle:close()
        -- Простой парсинг (требуется Lua JSON-библиотека или jq)
        -- Или используем jq:
        local cmd = string.format("curl -s http://%s:%s/v1/models | jq -r '.data[].id'", options.host, options.port)
        local pipe = io.popen(cmd)
        if not pipe then return {} end
        local models = {}
        for line in pipe:lines() do
          table.insert(models, line)
        end
        pipe:close()
        return models
      end,
    }
  end,

  keys = {
    -- { "", function() end, desc ="" },
  },
}
