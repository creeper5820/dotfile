return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--header-insertion=never",
          "-j=8",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      },
    },
  },
}
