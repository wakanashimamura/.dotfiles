--
--   ██████╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--  ██╔═══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--  ██║   ██║██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--  ██║   ██║██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║╚════██║
--  ╚██████╔╝██║        ██║   ██║╚██████╔╝██║ ╚████║███████║
--   ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
--

-- ┌────────────────────────────────────────────────────────────────┐
-- │                         BASIC SETTINGS                         │
-- └────────────────────────────────────────────────────────────────┘

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.scrolloff      = 10
vim.opt.sidescrolloff  = 8
vim.opt.wrap           = false
vim.opt.cmdheight      = 1

-- ┌────────────────────────────────────────────────────────────────┐
-- │                      TABBING / INDENTATION                     │
-- └────────────────────────────────────────────────────────────────┘

vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.softtabstop = 0
vim.opt.expandtab   = true
vim.opt.smartindent = true
vim.opt.autoindent  = true

-- ┌────────────────────────────────────────────────────────────────┐
-- │                         SEARCH SETTINGS                        │
-- └────────────────────────────────────────────────────────────────┘

vim.opt.grepprg    = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.opt.ignorecase = true
vim.opt.smartcase  = true
vim.opt.hlsearch   = true
vim.opt.incsearch  = true

-- ┌────────────────────────────────────────────────────────────────┐
-- │                         VISUAL SETTINGS                        │
-- └────────────────────────────────────────────────────────────────┘

vim.opt.background    = "dark"
vim.opt.termguicolors = true
vim.opt.signcolumn    = "yes"
vim.opt.colorcolumn   = "100"
vim.opt.showmatch     = true 
vim.opt.matchtime     = 2
vim.opt.completeopt   = "menuone,noinsert,noselect"
vim.opt.showmode      = false
vim.opt.pumheight     = 10
vim.opt.pumblend      = 0
vim.opt.winblend      = 0
vim.opt.conceallevel  = 0
vim.opt.concealcursor = ""
vim.opt.lazyredraw    = false
vim.opt.redrawtime    = 4000
vim.opt.maxmempattern = 20000
vim.opt.synmaxcol     = 3000

-- ┌────────────────────────────────────────────────────────────────┐
-- │                          FILE HANDLING                         │
-- └────────────────────────────────────────────────────────────────┘

vim.opt.backup      = false
vim.opt.writebackup = true
vim.opt.swapfile    = true
vim.opt.undofile    = true
vim.opt.updatetime  = 300
vim.opt.timeoutlen  = 1500 
vim.opt.ttimeoutlen = 0
vim.opt.autoread    = true
vim.opt.autowrite   = false

-- ┌────────────────────────────────────────────────────────────────┐
-- │                        Behavior Settings                       │
-- └────────────────────────────────────────────────────────────────┘

vim.opt.errorbells = false
vim.opt.backspace  = "indent,eol,start"
vim.opt.autochdir  = false 
vim.opt.selection  = "inclusive"
vim.opt.mouse      = "a"
vim.opt.modifiable = true
vim.opt.encoding   = "UTF-8"
vim.opt.wildmenu   = true 
vim.opt.wildmode   = "longest:full,full"

vim.opt.wildignorecase = true
vim.opt.iskeyword:append("-")
vim.opt.clipboard:append("unnamedplus")

-- ┌────────────────────────────────────────────────────────────────┐
-- │                         SPLIT BEHAVIOR                         │
-- └────────────────────────────────────────────────────────────────┘

vim.opt.splitbelow = true
vim.opt.splitright = true
