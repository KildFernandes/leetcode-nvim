local M = {}

function M.load_random_subdirectory(path)
  local items = vim.fn.readdir(path)

  local subdirs = {}
  for _, item in ipairs(items) do
    local full_path = path .. "/" .. item
    if vim.fn.isdirectory(full_path) == 1 then
      table.insert(subdirs, item)
    end
  end

  if #subdirs == 0 then
    vim.api.nvim_echo({{"Nenhum subdiretório encontrado em: " .. path, "None"}}, true, { err = true })
    return nil
  end

  local random_index = math.random(1, #subdirs)
  local chosen_subdir = subdirs[random_index]

  return path .. "/" .. chosen_subdir
end

return M
