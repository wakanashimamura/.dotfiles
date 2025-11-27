return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = '1.*',
  event = { "InsertEnter" },
  opts = {
    keymap = {
      preset = "enter",
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ["<C-k>"] = { 'select_prev', 'fallback' },
      ["<C-j>"] = { 'select_next', 'fallback' },
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
      ['<C-d>'] = { 'scroll_signature_down', 'fallback' },
      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<C-l>'] = { 'show_signature', 'hide_signature', 'fallback' }
    },

    completion = {
      keyword = { range = 'full' },

      accept = { auto_brackets = { enabled = true } },

      menu = { draw = { treesitter = { 'lsp' } } },

      documentation = { auto_show = true, auto_show_delay_ms = 500, treesitter_highlighting = true },

      ghost_text = { enabled = true }
    },

    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    cmdline = { enabled = false },
    snippets = { preset = 'default' },
    signature = { enabled = true }
  }
}
