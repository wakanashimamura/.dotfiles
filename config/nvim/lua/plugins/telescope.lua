return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.load_extension("fzf")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-h>"] = actions.preview_scrolling_left,
            ["<C-l>"] = actions.preview_scrolling_right,
            ["<C-f>"] = false
          },
          n = {
            ["<C-h>"] = actions.preview_scrolling_left,
            ["<C-l>"] = actions.preview_scrolling_right,
            ["<C-f>"] = false,
            ["<C-k>"] = false
          }
        }
      }
    })

    -- ──── Config ────
    vim.keymap.set('n', '<leader>fi',
                   function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end,
                   { desc = "Find in config" })

    -- ──── File ────
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set('n', '<leader>fs', function() builtin.grep_string({}) end,
                   { desc = "Grep current word" })
    vim.keymap.set('n', '<leader>fc', function()
      local filename_without_extension = vim.fn.expand('%:t:r')
      builtin.grep_string({ search = filename_without_extension })
    end, { desc = "Grep current file" })

    -- ──── Vim ────
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "List buffers" })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Recent files" })
    vim.keymap.set('n', '<leader>fhc', builtin.command_history, { desc = "Command history" })
    vim.keymap.set('n', '<leader>fhs', builtin.search_history, { desc = "Search history" })
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = "List quickfix" })

    -- ──── Git ────
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Git commits" })
    vim.keymap.set('n', '<leader>gb', builtin.git_bcommits, { desc = "Git buffer commits" })
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Git branches" })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Git status" })

    -- ──── Treesitter ────
    vim.keymap.set('n', '<leader>tt', builtin.treesitter, { desc = "Treesitter symbols" })

    -- ──── LSP ────
    vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, { desc = "LSP definitions" })
    vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = "LSP references" })
    vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, { desc = "LSP implementations" })
    vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols,
                   { desc = "LSP document symbols" })
    vim.keymap.set('n', '<leader>le', builtin.diagnostics, { desc = "LSP diagnostics" })
    vim.keymap.set('n', '<leader>lt', builtin.lsp_type_definitions,
                   { desc = "LSP type definitions" })
  end
}
