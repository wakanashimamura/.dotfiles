return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "dockerls",
        "fish_lsp",
        "jsonls",
        "lua_ls",
        "yamlls",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "clang-format",
        "cmakelang",
        "hadolint",
        "prettier",
        "shfmt",
        "shellcheck",
        "stylua",
      },
    })
  end
}
