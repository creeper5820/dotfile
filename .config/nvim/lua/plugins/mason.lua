return {
  -- Ensure C/C++ debugger is installed
  "mason-org/mason.nvim",
  optional = true,
  opts = { ensure_installed = { "codelldb" } },
}
