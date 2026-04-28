return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}

    -- Remove Comment Highlight
    opts.ensure_installed = vim.tbl_filter(function(lang)
      return lang ~= "luadoc"
    end, opts.ensure_installed)

    vim.list_extend(opts.ensure_installed, { "cpp" })
  end,
}
