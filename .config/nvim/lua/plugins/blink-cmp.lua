return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "ue" },
      providers = {
        ue = {
          module = "ue",
          name = "Unreal",
          score_offset = 15,
        },
      },
    },
    keymap = {
      preset = "super-tab",
      ["<A-j>"] = { "select_next", "fallback" },
      ["<A-k>"] = { "select_prev", "fallback" },
      ["<A-l>"] = { "hide", "fallback" },
    },
    fuzzy = {
      sorts = {
        "exact",
        "score",
        "sort_text",
        "label",
      },
    },
  },
}
