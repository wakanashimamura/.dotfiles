return {
-- ┌────────────────────────────────────────────────────────────────┐
-- │                            NEO TREE                            │
-- └────────────────────────────────────────────────────────────────┘ 

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal left<CR>", { desc = "Toggle Neotree" })
		  vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus Neotree" })
		  vim.keymap.set("n", "<leader>g", ":Neotree git_status float<CR>", { desc = "Neotree Git status" })
		  vim.keymap.set("n", "<leader>b", ":Neotree buffers reveal float<CR>", { desc = "Neotree buffers" })
      require("neo-tree").setup({
        window = {
          mappings = {
            ["Y"] = {
              function(state)
                local node = state.tree:get_node()
                local path = node.name
                vim.fn.setreg("+", path, "c")
              end,
              desc = "Copy file/folder name to Clipboard",
            },
            ["pY"] = {
              function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                  vim.fn.setreg("+", path, "c")
              end,
              desc = "Copy Path to Clipboard",
            },
          }
        },

        filesystem = {
          follow_current_file = { enabled = true },
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function()
              vim.wo.relativenumber = true
            end,
          }
        },
      })
    end
  },

-- ┌────────────────────────────────────────────────────────────────┐
-- │                       LSP FILE OPERATIONS                      │
-- └────────────────────────────────────────────────────────────────┘

  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end
  },

-- ┌────────────────────────────────────────────────────────────────┐
-- │                          WINDOW PICKER                         │
-- └────────────────────────────────────────────────────────────────┘

  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = 'floating-big-letter',
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end
  },
}
