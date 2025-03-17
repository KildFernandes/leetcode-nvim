local getdir = require('utils.problem-select')

local M = {}

---@param path string[]
function M.create_floating_window(path)
  local base_dir = "/home/kild/Documents/Projects/leetcode-nvim/algorithms/cplusplus/array"

  -- Escolher um subdiretório aleatório
  local chosen_dir = getdir.load_random_subdirectory(base_dir)
  if not chosen_dir then
    return
  end

  -- Tamanho da tela
  local width = vim.o.columns
  local height = vim.o.lines

  -- Dimensões da janela flutuante
  local win_width = math.ceil(width * 0.6)
  local win_height = math.ceil(height * 0.6)
  local col = math.ceil((width - win_width) / 2)
  local row = math.ceil((height - win_height) / 2)

  -- Criar um buffer sem nome
  local buf = vim.api.nvim_create_buf(false, true)

  -- Criar a janela flutuante
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  })

  -- Definir opções do buffer
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "modifiable", true)
  vim.api.nvim_buf_set_option(buf, "filetype", "cpp")

  local chosen_file = chosen_dir .. "/" .. "solution.h"

  -- Verificar se o arquivo existe e carregar seu conteúdo
  local lines = vim.fn.readfile(chosen_file)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  return buf, win, chosen_file
end

function M.save_buffer_to_file(buf, filepath)
  -- Obter as linhas do buffer
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  -- Salvar as linhas no arquivo
  vim.fn.writefile(lines, filepath)
  vim.api.nvim_echo({{"Arquivo salvo: " .. filepath, "None"}}, false, {})
end


return M
