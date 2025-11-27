local builtin = require('telescope.builtin')

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
██╗    ██╗ █████╗ ██╗  ██╗ █████╗ ███╗   ██╗ █████╗ 
██║    ██║██╔══██╗██║ ██╔╝██╔══██╗████╗  ██║██╔══██╗
██║ █╗ ██║███████║█████╔╝ ███████║██╔██╗ ██║███████║
██║███╗██║██╔══██║██╔═██╗ ██╔══██║██║╚██╗██║██╔══██║
╚███╔███╔╝██║  ██║██║  ██╗██║  ██║██║ ╚████║██║  ██║
 ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝
        ]],
        keys = {
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = function() builtin.find_files() end
          },
          {
            icon = " ",
            key = "n",
            desc = "New File",
            action = function() vim.cmd("ene | startinsert") end
          },
          {
            icon = " ",
            key = "e",
            desc = "Neo-tree Float",
            action = function()
              require("neo-tree.command").execute({
                toggle = true,
                reveal = true,
                position = "float",
                cwd = vim.loop.cwd()
              })
            end
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = function() builtin.oldfiles() end
          },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = function() builtin.live_grep() end
          },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end
          },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = function() vim.cmd("Lazy") end },
          { icon = " ", key = "q", desc = "Quit", action = function() vim.cmd("qa") end }
        }
      }
    }
  }
}
