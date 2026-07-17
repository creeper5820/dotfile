local M = {}
local macro_patterns = { "UPROPERTY", "UFUNCTION", "UCLASS", "USTRUCT", "UENUM", "UINTERFACE" }

local items = {}
for _, name in ipairs{
  "VisibleAnywhere", "EditAnywhere", "VisibleInstanceOnly", "EditInstanceOnly",
  "BlueprintReadOnly", "BlueprintReadWrite", "BlueprintAssignable", "BlueprintCallable",
  "BlueprintAuthorityOnly", "Category", "Transient", "Config", "GlobalConfig",
  "Replicated", "ReplicatedUsing", "AdvancedDisplay", "SimpleDisplay", "EditFixedSize",
  "NoClear", "AssetRegistrySearchable", "SaveGame", "SkipSerialization",
  "TextExportTransient", "NonPIETransient", "NonTransactional",
  "NativeAccessSpecifierPublic", "NativeAccessSpecifierProtected",
  "NativeAccessSpecifierPrivate", "Export", "NoExport",
} do
  table.insert(items, { label = name, detail = "UPROPERTY", kind = 14 })
end

function M.new() return setmetatable({}, { __index = M }) end

function M:get_completions(_, callback)
  local cursor = vim.api.nvim_win_get_cursor(0)
  if not cursor then return callback() end
  local line = vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], false)[1]
  if not line then return callback() end

  local pre = line:sub(1, cursor[2] + 1)
  for _, name in ipairs(macro_patterns) do
    if pre:match(name .. "%s*%(") then
      callback({ items = items, is_incomplete_forward = false })
      return
    end
  end
  callback()
end

return M
