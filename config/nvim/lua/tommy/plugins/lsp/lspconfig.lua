return {
  "neovim/nvim-lspconfig",
  event = { 'BufEnter', 'BufNewFile' },
  config = function()
    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Set default filetype of ft to terraform
    vim.cmd([[
      augroup terraform_filetype
        autocmd!
        autocmd BufNewFile,BufRead *tf set filetype=terraform
      augroup END
    ]])

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Adding default capabilities to all servers
    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(args)
        local opts = { noremap = true, silent = true, buffer = args.buf }
        local keymap = vim.keymap

        local function checkBufferMethod(method)
          for _, curentClient in pairs(vim.lsp.get_clients({ bufnr = args.buf })) do
            if curentClient:supports_method(method) then
              return true
            end
          end
          return false
        end

        -- General LSP-related keymaps
        opts.desc = "Show LSP references"
        keymap.set("n", "<leader>cR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>crs", ":LspRestart<CR>", opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>cD", "<cmd>Telescope diagnostics bufnr=1<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)

        opts.desc = "Show dynamic workspace symbols"
        keymap.set("n", "<leader>css", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)

        -- Per-capability mappings
        if checkBufferMethod('textDocument/declaration') then
          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        end

        if checkBufferMethod('textDocument/definition') then
          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>zz", opts)
        else
          opts.desc = "Definition not supported"
          keymap.set("n", "gd", function() print("LSP: definition not supported") end, opts)
        end

        if checkBufferMethod('textDocument/implementation') then
          opts.desc = "Show LSP implementations"
          keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_implementations<CR>", opts)
        end

        if checkBufferMethod('textDocument/typeDefinition') then
          opts.desc = "Show LSP type definitions"
          keymap.set("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        end

        if checkBufferMethod('textDocument/codeAction') then
          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end

        if checkBufferMethod('textDocument/rename') then
          opts.desc = "Smart rename"
          keymap.set("n", "<leader>crn", vim.lsp.buf.rename, opts)
        end

        -- Optional: format on save, if no willSaveWaitUntil but formatting supported
        -- if not client.supports_method('textDocument/willSaveWaitUntil')
        --     and client.supports_method('textDocument/formatting') then
        --   vim.api.nvim_create_autocmd('BufWritePre', {
        --     group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        --     buffer = args.buf,
        --     callback = function()
        --       vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        --     end,
        --   })
        -- end
      end,
    })


    -- configure lua server (with special settings)
    vim.lsp.config('lua_ls',
      {
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      }
    )

    -- configure java server (with special settings)
    vim.lsp.config("jdtls",
      {
        cmd = { 'jdtls' },
        -- root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
      })

    -- configure dartls server (with special settings)
    -- require("flutter-tools").setup({
    --   lsp = {
    --     capabilities = capabilities,
    --     on_attach = on_attach,
    --   }
    -- })
  end,
}
