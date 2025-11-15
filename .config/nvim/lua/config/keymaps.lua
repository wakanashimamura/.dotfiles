--
--  ██╗  ██╗███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ ███████╗
--  ██║ ██╔╝██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██╔══██╗██╔════╝
--  █████╔╝ █████╗   ╚████╔╝ ██╔████╔██║███████║██████╔╝███████╗
--  ██╔═██╗ ██╔══╝    ╚██╔╝  ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║
--  ██║  ██╗███████╗   ██║   ██║ ╚═╝ ██║██║  ██║██║     ███████║
--  ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝
--

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- ┌────────────────────────────────────────────────────────────────┐
-- │                         BETTER UP/DOWN                         │
-- └────────────────────────────────────────────────────────────────┘

map({"n","x"}, "j",      "v:count == 0 ? 'gj' : 'j'", { expr=true, silent=true, desc="Down" })
map({"n","x"}, "k",      "v:count == 0 ? 'gk' : 'k'", { expr=true, silent=true, desc="Up"   })
map({"n","x"}, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr=true, silent=true, desc="Down" })
map({"n","x"}, "<Up>",   "v:count == 0 ? 'gk' : 'k'", { expr=true, silent=true, desc="Up"   })

-- ┌────────────────────────────────────────────────────────────────┐
-- │                              TABS                              │
-- └────────────────────────────────────────────────────────────────┘

map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>",      {desc="New Tab"         })
map("n", "<leader><tab>]",     "<cmd>tabnext<cr>",     {desc="Next Tab"        })
map("n", "<leader><tab>[",     "<cmd>tabprevious<cr>", {desc="Prev Tab"        })
map("n", "<leader><tab>l",     "<cmd>tablast<cr>",     {desc="Last Tab"        })
map("n", "<leader><tab>f",     "<cmd>tabfirst<cr>",    {desc="First Tab"       })
map("n", "<leader><tab>o",     "<cmd>tabonly<cr>",     {desc="Close Other Tabs"})
map("n", "<leader><tab>d",     "<cmd>tabclose<cr>",    {desc="Close Tab"       })

-- ┌────────────────────────────────────────────────────────────────┐
-- │                        WINDOW NAVIGATION                       │
-- └────────────────────────────────────────────────────────────────┘

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window"   })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window"    })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window"  })


-- ┌────────────────────────────────────────────────────────────────┐
-- │                      SPLITTING & RESIZING                      │
-- └────────────────────────────────────────────────────────────────┘

map("n", "<leader>|",  "<Cmd>vsplit<CR>", { desc = "Split window vertically"   })
map("n", "<leader>-",  "<Cmd>split<CR>",  { desc = "Split window horizontally" })
map("n", "<leader>wd", "<C-W>c",          {desc="Delete Window"})

map("n", "<C-Up>",    "<Cmd>resize +2<CR>",          { desc = "Increase window height" })
map("n", "<C-Down>",  "<Cmd>resize -2<CR>",          { desc = "Decrease window height" })
map("n", "<C-Left>",  "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width"  })
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width"  })

-- ┌────────────────────────────────────────────────────────────────┐
-- │                           MOVE LINES                           │
-- └────────────────────────────────────────────────────────────────┘

map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==",                   {desc="Move Down"})
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",             {desc="Move Up"  })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi",                                   {desc="Move Down"})
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi",                                   {desc="Move Up"  })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",       {desc="Move Down"})
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", {desc="Move Up"  })

-- ┌────────────────────────────────────────────────────────────────┐
-- │                             BUFFER                             │
-- └────────────────────────────────────────────────────────────────┘

map("n", "<S-h>",      "<cmd>bprevious<cr>", { desc = "Prev Buffer"              })
map("n", "<S-l>",      "<cmd>bnext<cr>",     { desc = "Next Buffer"              })
map("n", "<leader>bb", "<cmd>e #<cr>",       { desc = "Switch to Other Buffer"   })
map("n", "<leader>bD", "<cmd>:bd<cr>",       { desc = "Delete Buffer and Window" })

-- ┌────────────────────────────────────────────────────────────────┐
-- │             CLEAR SEARCH AND STOP SNIPPET ON ESCAPE            │
-- └────────────────────────────────────────────────────────────────┘

map({"i","n","s"}, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, {expr=true, desc="Escape and clear hlsearch"})

-- ┌────────────────────────────────────────────────────────────────┐
-- │                        BETTER INDENTING                        │
-- └────────────────────────────────────────────────────────────────┘

map("x", "<", "<gv", { desc = "Indent left and reselect"  })
map("x", ">", ">gv", { desc = "Indent right and reselect" })

-- ┌────────────────────────────────────────────────────────────────┐
-- │                             GENERAL                            │
-- └────────────────────────────────────────────────────────────────┘

map("n", "<C-c>",      "<cmd>%y+<CR>",      { desc = "General copy whole file" })
map("n", "<leader>n",  "<cmd>set nu!<CR>",  { desc = "Toggle line number"      })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number"  })
