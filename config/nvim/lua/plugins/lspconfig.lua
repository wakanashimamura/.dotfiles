return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { { "folke/lazydev.nvim", opts = {} } },
  config = function()
    vim.diagnostic.config({
      virtual_text = true,
      severity_sort = true,
      update_in_insert = false,
      float = { style = "minimal", border = "rounded", source = "if_many", header = "", prefix = "" },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "⚑",
          [vim.diagnostic.severity.INFO] = "»"
        }
      }
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my_lsp", {}),
      callback = function(event)
        local map = vim.keymap.set
        local opts = { buffer = event.buf, silent = true }

        opts.desc = "Show LSP references"
        map("n", "gr", vim.lsp.buf.references, opts)

        opts.desc = "Go to declaration"
        map("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definition"
        map("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Show LSP implementations"
        map("n", "gi", vim.lsp.buf.implementation, opts)

        opts.desc = "Show LSP type definitions"
        map("n", "D", vim.lsp.buf.type_definition, opts)

        opts.desc = "See available code actions"
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show line diagnostics"
        map("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

        opts.desc = "Go to next diagnostic"
        map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)

        opts.desc = "Signature Help"
        map("n", "gK", vim.lsp.buf.signature_help, opts)

        opts.desc = "Signature Help"
        map("i", "<c-n>", vim.lsp.buf.signature_help, opts)

        opts.desc = "Show documentation for what is under cursor"
        map("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Add workspace folder"
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)

        opts.desc = "Remove workspace folder"
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)

        opts.desc = "List workspace folders"
        map("n", "<leader>wl",
            function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

        opts.desc = "Restart LSP"
        map("n", "<leader>rs", ":LspRestart<cr>", opts)

        opts.desc = "toggle diagnostics in insert"
        map("n", "<leader>ud", function()
          local current = vim.diagnostic.config().update_in_insert
          vim.diagnostic.config({ update_in_insert = not current })
          vim.notify("update_in_insert = " .. tostring(not current))
        end, opts)
      end
    })
  end
}
