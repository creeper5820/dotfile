return {
  "hrsh7th/nvim-cmp",
  optional = true,
  opts = function(_, opts)
    opts.sorting = opts.sorting or {}
    opts.sorting.comparators = opts.sorting.comparators or {}
    table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
  end,
}
