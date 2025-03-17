local M = {}

function M.load_random_subdirectory(base_dir)
  local items = vim.fn.readdir(base_dir)

  local subdirs = {}
  for _, item in ipairs(items) do
    local full_path = base_dir .. "/" .. item
    if vim.fn.isdirectory(full_path) == 1 then
      table.insert(subdirs, item)
    end
  end

  if #subdirs == 0 then
    vim.api.nvim_echo({{"Nenhum subdiretório encontrado em: " .. base_dir, "None"}}, true, {})
    return nil
  end

  local random_index = math.random(1, #subdirs)
  local chosen_subdir = subdirs[random_index]

  return base_dir .. "/" .. chosen_subdir
end

return M
