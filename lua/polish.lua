-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

require("nvim-treesitter.install").compilers = { "clang" }
vim.api.nvim_exec("language en_US", true)
vim.fn.timer_start(100, function()
  vim.cmd "set keymap=russian-jcukenwin"
  vim.cmd "set iminsert=0"
  vim.cmd "set imsearch=0"
  -- vim.cmd "set laststatus=2"
end)

require("notify").setup {
  background_colour = "NotifyBackground",
  fps = 1,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "static",
  timeout = 5000,
  top_down = true,
  max_width = nil,
  max_height = nil,
  on_open = nil,
  on_close = nil,
}

local telescope = require "telescope"
local lga_actions = require "telescope-live-grep-args.actions"

telescope.setup {
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
  },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.teraonline_definitions = {
  install_info = {
    url = "D://pinki//backstep//treesitter-teradefinition", -- local path or git repo
    files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "def", -- if filetype does not match the parser name
}

-- ANGULAR --
vim.cmd [[
    autocmd BufRead,BufEnter *.component.html set filetype=angular
    ]]
-- angular template parse as standart html
vim.cmd [[
          augroup matchup_matchparen_enable_ft
            autocmd!
                autocmd FileType angular let b:match_words = matchup#util#standard_html()

          augroup END
    ]]
parser_config.angular_beta = {
  install_info = {
    url = "D:\\angular17tree\\tree-sitter-angular", -- local path or git repo
    files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
}
-- !ANGULAR --

-- DOTNET
vim.g.dotnet_build_project = function()
  local default_path = vim.fn.getcwd() .. "/"
  if vim.g["dotnet_last_proj_path"] ~= nil then default_path = vim.g["dotnet_last_proj_path"] end
  -- local path = vim.fn.input('Path to your *proj file', default_path, 'file')
  -- vim.g['dotnet_last_proj_path'] = path
  local msbuildPatch = '"D:/Program Files/Microsoft Visual Studio/2022/Enterprise/MSBuild/Current/Bin/msbuild.exe"'
  -- local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
  local solution = vim.fn.input "Name solution file: "
  local cmd = msbuildPatch
    .. " "
    .. solution
    .. ".sln  /p:Configuration=Debug /l:FileLogger,Microsoft.Build.Engine;logfile=Manual_MSBuild_DebugVersion_LOG.log"
  print ""
  print("Cmd to execute: " .. cmd)
  local f = os.execute(cmd)
  if f == 0 then
    print "\nBuild: ✔️ "
  else
    print("\nBuild: ❌ (code: " .. f .. ")")
  end
end

vim.g.dotnet_get_dll_path = function()
  local request = function()
    if vim.g["dotnet_last_dll_path"] ~= nim then return vim.fn.input("Path to dll ", vim.g["dotnet_last_dll_path"]) end

    return vim.fn.input("Path to dll ", vim.fn.getcwd() .. "/bin/Debug/net8-windows/win-x64/", "file")
  end

  if vim.g["dotnet_last_dll_path"] == nil then
    vim.g["dotnet_last_dll_path"] = request()
  else
    if
      vim.fn.confirm("Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2) == 1
    then
      vim.g["dotnet_last_dll_path"] = request()
    end
  end

  return vim.g["dotnet_last_dll_path"]
end
-- !DOTNET
-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

if next(vim.fn.argv()) == nil then
  -- require("session_manager").load_session()
  require("resession").load()
end
-- if next(vim.fn.argv()) == nil then
--   vim.api.nvim_create_autocmd("UIEnter", {
--     callback = function()
--       vim.fn.timer_start(0, function() require("resession").load() end)
--     end,
--   })
-- end
--
local os = require "os"

-- local path_to_desktop = os.getenv("USERPROFILE") .. ""
local path = "D:/pinki"

local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = "*", command = "cd " .. path, group = vim_enter_group })
