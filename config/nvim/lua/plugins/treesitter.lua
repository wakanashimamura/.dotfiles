local function treesitter_start(bufnr, parser_name)
  vim.treesitter.start(bufnr, parser_name)
  vim.bo[bufnr].syntax = "on"
  vim.wo.foldlevel = 99
  vim.wo.foldmethod = "expr"
  vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
  vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  config = function()
    local parsers = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "diff",
      "dockerfile",
      "fish",
      "gitcommit",
      "json",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc"
    }

    local treesitter = require("nvim-treesitter")
    treesitter.setup({ install_dir = vim.fn.stdpath('data') .. '/site' })

    local installed = treesitter.get_installed()
    local to_install = vim.tbl_filter(function(parser)
      return not vim.tbl_contains(installed, parser)
    end, parsers)

    if #to_install > 0 then treesitter.install(to_install):await() end

    vim.api.nvim_create_autocmd({ "FileType" }, {
      callback = function(event)
        local buffer = event.buf
        local filetype = event.match

        if filetype == "" then return end

        local parser = vim.treesitter.language.get_lang(filetype)
        if not parser then return end

        if not vim.tbl_contains(treesitter.get_available(), parser) then return end

        if not vim.tbl_contains(installed, parser) then
          vim.notify("Installing parser for " .. parser, vim.log.levels.INFO)
          treesitter.install({ parser }):await(function() treesitter_start(buffer, parser) end)
          return
        end

        treesitter_start(buffer, parser)
      end
    })
  end
}
