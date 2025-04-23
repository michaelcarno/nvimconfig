return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "mctheme",
  -- colorscheme = "astrotheme",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false,
    underline = true,
  },
  lsp = {
    -- setup_handlers = {
    --   -- add custom handler
    --   tsserver = function(_, opts) require("typescript-tools").setup { server = opts } end
    -- ngserver = function(_,opts) require()end
    -- },

    -- customize lsp formatting options
    formatting = {

      -- filter = function(client)
      --   if vim.bo.filetype == "angular" then
      --       return client.name == "null-ls"
      -- end
      -- return true
      -- end,
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        "html", -- eslint do it better that html-lsp (it doesnt read editorconfig)
        -- "tsserver"
        -- "sumneko_lua",
      },
      timeout_ms = 3000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      vtsls = {
        settings = {
          javascript = {
            suggest = { completeFunctionCalls = { enabled = true } },
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
          typescript = {
            suggest = { completeFunctionCalls = { enabled = true } },
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
          autoUseWorkspaceTsdk = { enabled = true },
        },
      },
      omnisharp = {
        settings = {
          RoslynExtensionsOptions = {
            InlayHintsOptions = {
              EnableForParameters = true,
              ForLiteralParameters = true,
              ForIndexerParameters = true,
              ForObjectCreationParameters = true,
              ForOtherParameters = true,
              SuppressForParametersThatDifferOnlyBySuffix = false,
              SuppressForParametersThatMatchMethodIntent = false,
              SuppressForParametersThatMatchArgumentName = false,
              EnableForTypes = true,
              ForImplicitVariableTypes = true,
              ForLambdaParameterTypes = true,
              ForImplicitObjectCreatio = true,
            },
          },
        },
      },
      pylyzer = {
        settings = {
          python = {
            inlayHints = true,
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              bindingModeHints = {
                enable = false,
              },
              chainingHints = {
                enable = true,
              },
              closingBraceHints = {
                enable = true,
                minLines = 25,
              },
              closureReturnTypeHints = {
                enable = "never",
              },
              lifetimeElisionHints = {
                enable = "never",
                useParameterNames = false,
              },
              maxLength = 25,
              parameterHints = {
                enable = true,
              },
              reborrowHints = {
                enable = "never",
              },
              renderColons = true,
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
            },
          },
        },
      },
      deno = {
        settings = {
          deno = {
            inlayHints = {
              parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enable = true },
              enumMemberValues = { enabled = true },
            },
          },
        },
      },
      clangd = {
        settings = {
          clangd = {
            InlayHints = {
              Designators = true,
              Enabled = true,
              ParameterNames = true,
              DeducedTypes = true,
            },
            fallbackFlags = { "-std=c++20" },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            hint = {
              enable = true, -- necessary
            },
          },
        },
      },
      cssmodules_ls = {
        filetypes = { "angular", "htmlangular", "html", "css", "scss" },
      },
      ltex = {
        filetypes = {
          "bib",
          -- "gitcommit",
          -- "markdown",
          -- "org",
          "plaintex",
          -- "rst",
          -- "rnoweb",
          "tex",
          -- "pandoc",
          -- "quarto",
          -- "rmd",
          -- "context",
          -- "html",
          -- "xhtml",
        },
      },
      tailwindcss = {
        filetypes = { "angular", "htmlangular", "html" },
      },
      angularls = {
        filetypes = { "angular", "htmlangular", "typescript", "html", "typescriptreact", "typescript.tsx" },
      },

      emmet_ls = {
        filetypes = {
          "astro",
          "angular",
          -- "typescript",
          "css",
          "eruby",
          "html",
          "htmldjango",
          "javascriptreact",
          "less",
          "pug",
          "sass",
          "scss",
          "svelte",
          "typescriptreact",
          "vue",
          "htmlangular",
        },
      },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    -- concurrency = 1,
    -- git = {
    --   throttle = {
    --     enabled = true, -- not enabled by default
    --     -- max 2 ops every 5 seconds
    --     rate = 2,
    --     duration = 5 * 1000, -- in ms
    --   },
    -- },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  plugins = {
    {
      "akinsho/toggleterm.nvim",
      opts = {
        float_opts = {
          -- The border key is *almost* the same as 'nvim_open_win'
          -- see :h nvim_open_win for details on borders however
          -- the 'curved' border is a custom border type
          -- not natively supported but implemented in this plugin.
          width = 160,
          height = 200,
          -- winblend = 3,
          -- zindex =,
        },
      },
    },
  },
  polish = function()
    -- request neovim v0.10+ for vim.ui.input
    -- and dressing.nvim for float window.

    if vim.g.neovide then
      vim.cmd [[ set guifont=JetBrainsMono\ NF:h15]]
      vim.cmd [[ let g:neovide_opacity=0.7 ]]
    end

    vim.keymap.set("i", "<M-.>", function()
      vim.ui.input({ prompt = "Calc: " }, function(input)
        local calc = load("return " .. (input or ""))()
        if calc then vim.api.nvim_feedkeys(tostring(calc), "i", true) end
      end)
    end)

    -- USE POWER SHELL INSTEAD CMD
    -- local powershell_options = {
    --   shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    --   shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    --   shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    --   shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    --   shellquote = "",
    --   shellxquote = "",
    -- }
    --
    -- for option, value in pairs(powershell_options) do
    --   vim.opt[option] = value
    -- end
    --
    --

    -- disable some features for big files
    vim.api.nvim_create_autocmd("BufReadPre", {
      callback = function(args)
        if vim.b[args.buf].large_buf then
          require("rainbow-delimiters").disable(args.buf)
          -- require("ufo").disableFold(args.buf)
          -- vim.lsp.stop_client(vim.lsp.get_clients())

          -- vim.cmd "UfoDetach"
          -- vim.cmd "Gitsigns detach"
          vim.opt_local.foldmethod = "manual"
          vim.opt_local.spell = false
          -- vim.cmd "MatchParenDisable"
        end
      end,
    })
    --
    -- disable auto continue comment block
    vim.cmd [[
    autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
    ]]

    -- vim.diagnostic.config {
    --   virtual_text = {
    --     prefix = "●",
    --     source = "if_many",
    --     severity = vim.diagnostic.severity.ERROR,
    --     -- virt_text_hide = true,
    --     -- hl_mode = "replace",
    --   },
    -- }

    vim.cmd [[
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,angular,htmlangular,typescript EmmetInstall
    let g:user_emmet_leader_key='<M-,>'
    ]]
    -- vim.cmd [[let g:codeium_bin = "c:/nvim/soft/language_server_windows_x64.exe"]]
    --     vim.cmd [[
    -- syntax region htmlFold start="<\z(\<\(area\|base\|br\|col\|command\|embed\|hr\|img\|input\|keygen\|link\|meta\|para\|source\|track\|wbr\>\)\@![a-z-]\+\>\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)" end="</\z1\_s*>" fold transparent keepend extend containedin=htmlHead,htmlH\d
    -- ]]
    -- vim.cmd [[nnoremap <C-K> <C-y>]]
    -- vim.cmd [[nnoremap <C-J> <C-e>]]

    -- vim.cmd "g:codeium_bin = "c:/nvim/soft/language_server_windows_x64"
    -- disable diagnostic in insert mode
    -- Display diagnostics as virtual text only if not in insert mode
    -- vim.api.nvim_create_autocmd("InsertEnter", {
    --   pattern = "*",
    --   callback = function()
    --     vim.diagnostic.config({
    --       virtual_text = false,
    --     })
    --   end
    -- })
    -- vim.api.nvim_create_autocmd("InsertLeave", {
    --   pattern = "*",
    --   callback = function()
    --     vim.diagnostic.config({
    --       virtual_text = true,
    --     })
    --   end
    -- })

    -- REFACTOR or DELETE after  it will be fixed in 0.10 https://github.com/nvim-telescope/telescope.nvim/issues/2027
    -- vim.api.nvim_create_autocmd("WinLeave", {
    --   callback = function()
    --     if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
    --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    --     end
    --   end,
    -- })
    --
    -- turn off semantic tokens (break hightlight in TS mb on other languges too)
    -- mb should turn it on after fix
    -- require('lspconfig').graphql.setup({
    --   on_attach = function(client)
    --     client.server_capabilities.workspaceSymbolProvider = false
    --   end,
    --   filetypes = {
    --     "graphql",
    --     "typescriptreact",
    --     "typescript",
    --     "javascript",
    --     "javascriptreact"
    --   }
    -- })
    --
    --
    -- vim.opt.list = true
    -- vim.opt.listchars:append "space:⋅"
    -- vim.opt.listchars:append "eol:↴"

    vim.opt.title = true
    vim.opt.titlelen = 20
    vim.opt.titlestring = '%{expand("%:h")} - nvim'

    if next(vim.fn.argv()) == nil and not vim.g.started_by_firenvim then
      vim.api.nvim_create_autocmd("UIEnter", {
        callback = function()
          vim.cmd [[cd ~]]
          vim.cmd "SessionManager load_session"
          -- vim.fn.timer_start(0, function() vim.cmd "SessionManager load_session" end)
        end,
      })
    end
    vim.fn.timer_start(0, function()
      vim.cmd "set keymap=russian-jcukenwin"
      vim.cmd "set iminsert=0"
      vim.cmd "set imsearch=0"
      -- vim.cmd "set iskeyword-=_"
      vim.cmd "set laststatus=3"
    end)
    -- vim.api.nvim_create_autocmd("BufEnter", {
    --   callback = function()
    --     vim.fn.timer_start(100, function()
    --       vim.cmd "set title"
    --       vim.cmd "set titlestring=\"NVIM %F\""
    --     end)
    --   end,
    -- })
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.teraonline_definitions = {
      install_info = {
        url = "D://proxy//backstep//treesitter-teradefinition", -- local path or git repo
        files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "main", -- default branch in case of git repo if different from master
        generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
      },
      filetype = "def", -- if filetype does not match the parser name
    }

    vim.cmd [[
    autocmd BufRead,BufEnter *.component.html set filetype=htmlangular
    ]]
    --
    -- также надо добавить filetype.vim с содержимым
    -- autocmd BufRead,BufEnter *.component.html set filetype=angular
    -- C:\Users\michaelcarno\AppData\Local\nvim-data\lazy\nvim-treesitter-angular\ftdetect
    --

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
    --
    -- чтобы поменять стандартный репозиторий на свой но надо править lockfile
    --
    --   parsers.get_parser_configs().angular = {
    --       install_info = {
    --             url = "https://github.com/steelsojka/tree-sitter-angular",
    --                   files = { "src/parser.c" },
    --                         branch = "main"
    --                             },
    --                                 maintainers = {"@steelsojka"}
    --                                   }
    --
    --                                     if not parsers.has_parser("angular") then
    --                                         installer.update("angular")
    --                                           end
    --                                           end
    --
    --

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
      max_width = 50,
      max_height = 5,
      on_open = nil,
      on_close = nil,
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T",
      },
      timeout = 2000,
      top_down = true,
    }
    -- lsp_mappings.n["<leader>lG"][1] = function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end
    -- grep with args plugin

    local telescope = require "telescope"
    local lga_actions = require "telescope-live-grep-args.actions"

    -- telescope.setup {
    --   extensions = {
    --     live_grep_args = {
    --       auto_quoting = true, -- enable/disable auto-quoting
    --       -- define mappings, e.g.
    --       mappings = { -- extend mappings
    --         i = {
    --           ["<C-k>"] = lga_actions.quote_prompt(),
    --           ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
    --         },
    --       },
    --       -- ... also accepts theme settings, for example:
    --       -- theme = "dropdown", -- use dropdown theme
    --       -- theme = { }, -- use own theme spec
    --       -- layout_config = { mirror=true }, -- mirror preview pane
    --     },
    --   },
    -- }

    vim.g.firenvim_config = {
      globalSettings = { alt = "all" },
      localSettings = {
        [".*"] = {
          cmdline = "neovim",
          content = "text",
          priority = 1,
          selector = "",
          takeover = "never",
        },
      },
    }

    if vim.g.started_by_firenvim == true then
      -- vim.api.nvim_create_autocmd("UIEnter", {
      --   pattern = "*",
      --   cmd = "set guifont=JetBrainsMonoNF:h15",
      -- })
      vim.g.icons_enabled = false
      vim.api.nvim_create_autocmd("UIEnter", {
        callback = function()
          vim.fn.timer_start(100, function()
            vim.opt.lines = 15
            vim.cmd "set guifont=JetBrainsMono:h15"
          end)
        end,
      })
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = "github.com_*.txt",
        cmd = "set filetype=markdown",
      })
      -- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      --   pattern = "*.txt",
      --   cmd = "set filetype=html"
      -- })
    end

    vim.api.nvim_exec("language en_US", true)
    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   callback = function(args)
    --     local client = vim.lsp.get_client_by_id(args.data.client_id)
    --     client.server_capabilities.semanticTokensProvider = nil
    --   end,
    -- });

    require("nvim-treesitter.install").compilers = { "clang" }
    -- require 'nvim-treesitter.install'.compilers = { "clang" }
    -- require('lspconfig').tsserver.setup({})
    -- require('lspconfig').tsserver.setup {
    --   -- init_options = {
    --   --   preferences = {
    --   --     disableSuggestions = true
    --   --   }
    --   -- },
    --   filetypes = {
    --     'typescript',
    --     'typescriptreact',
    --     'typescript.tsx',
    --   },
    -- }
    -- fixing clangd bug with notification spam
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.offsetEncoding = { "utf-16" }

    require("lspconfig").clangd.setup { capabilities = capabilities }
    require("notify").setup {
      stages = "static",
    }
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
        if vim.g["dotnet_last_dll_path"] ~= nil then
          return vim.fn.input("Path to dll ", vim.g["dotnet_last_dll_path"])
        end

        return vim.fn.input("Path to dll ", vim.fn.getcwd() .. "/bin/Debug/net8-windows/win-x64/", "file")
      end

      if vim.g["dotnet_last_dll_path"] == nil then
        vim.g["dotnet_last_dll_path"] = request()
      else
        if
          vim.fn.confirm("Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2)
          == 1
        then
          vim.g["dotnet_last_dll_path"] = request()
        end
      end

      return vim.g["dotnet_last_dll_path"]
    end -- lsp_mappings.n["<leader>lG"][1] = function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end

    -- vim.keymap.set("n", "<leader>lG", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    --   { desc = "Search global symbol" })

    -- cmp customizing
    -- vscode icons style
    -- local cmp_kinds = {
    --   Text = '  ',
    --   Method = '  ',
    --   Function = '  ',
    --   Constructor = '  ',
    --   Field = '  ',
    --   Variable = '  ',
    --   Class = '  ',
    --   Interface = '  ',
    --   Module = '  ',
    --   Property = '  ',
    --   Unit = '  ',
    --   Value = '  ',
    --   Enum = '  ',
    --   Keyword = '  ',
    --   Snippet = '  ',
    --   Color = '  ',
    --   File = '  ',
    --   Reference = '  ',
    --   Folder = '  ',
    --   EnumMember = '  ',
    --   Constant = '  ',
    --   Struct = '  ',
    --   Event = '  ',
    --   Operator = '  ',
    --   TypeParameter = '  ',
    -- }
    -- require("cmp").setup({
    --   window = {
    --     completion = {
    --       winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    --       col_offset = -3,
    --       side_padding = 0,
    --     },
    --   },
    --   formatting = {
    --     fields = { "kind", "abbr", "menu" },
    --     format = function(entry, vim_item)
    --       local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
    --       local strings = vim.split(kind.kind, "%s", { trimempty = true })
    --       kind.kind = " " .. (strings[1] or "") .. " "
    --       kind.menu = "    (" .. (strings[2] or "") .. ")"
    --
    --       return kind
    --     end,
    --   },
    -- })
    -- dap.adapters.chrome = {
    --   type = "executable",
    --   command = "node",
    --   args = {
    --     "C:\\Users\\michaelcarno\\AppData\\Local\\nvim-data\\mason\\packages\\chrome-debug-adapter\\out\\src\\chromeDebug.js",
    --     "45635" }
    -- }
    --
    -- dap.configurations.javascript = {
    --   {
    --     type = "chrome",
    --     request = "attach",
    --     program = "${file}",
    --     -- debugServer = 45635,
    --     cwd = vim.fn.getcwd(),
    --     sourceMaps = true,
    --     protocol = "inspector",
    --     port = 9222,
    --     webRoot = "${workspaceFolder}",
    --   }
    -- }
    -- dap.configurations.typescript = {
    --   {
    --     type = "chrome",
    --     request = "attach",
    --     program = "${file}",
    --     cwd = vim.fn.getcwd(),
    --     sourceMaps = true,
    --     -- debugServer = 45635,
    --     protocol = "inspector",
    --     port = 9222,
    --     webRoot = "${workspaceFolder}",
    --   },
    -- }
    --
    -- vim.opt.list = true
    -- vim.opt.listchars:append "space:⋅"
    -- vim.opt.listchars:append "eol:↴"
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    -- command to build treesiter  (have to install LLVM)
    --cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build

    -- local config = vim.tbl_deep_extend("force", default_config, require("vtsls_commands").setup or {})

    -- Function to send commands to vtsls

    -- local function send_to_vtsls(command, args)
    --   vim.lsp.buf.execute_command {
    --     command = command,
    --     arguments = args,
    --   }
    -- end
    --
    -- -- local command = {
    -- --   command = "typescript.selectTypeScriptVersion", -- Replace with actual command name supported by vtsls
    -- --   arguments = { "5.2.2" }, -- Pass necessary arguments; here we pass the current file path
    -- --   vim.lsp.buf.execute_command(command),
    -- -- }
    --
    -- local command = {
    --   command = "typescript.organizeImports",
    --   arguments = { vim.api.nvim_buf_get_name(0) },
    -- }
    --
    -- vim.keymap.set(
    --   "n",
    --   "lm",
    --   function() send_to_vtsls("typescript.organizeImports", { vim.api.nvim_buf_get_name(0) }) end
    -- )
    -- vim.keymap.set("n", "lv", function() send_to_vtsls("typescript.selectTypeScriptVersion", {}) end)
    -- --
    -- -- vim.keymap.set(
    -- --   "n",
    -- --   "lu",
    -- --   function() send_to_vtsls("typescript.removeUnusedImports", { vim.api.nvim_buf_get_name(0) }) end
    -- -- )
  end,
}
