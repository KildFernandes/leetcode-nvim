local M = {}

function M.submit()
   -- Obter o buffer atual
  local current_buf = vim.api.nvim_get_current_buf()

  -- Obter o caminho do arquivo que foi carregado na janela flutuante
  local chosen_file = vim.w.chosen_file

  -- Salvar o conteúdo do buffer atual no arquivo
  save_buffer_to_file(current_buf, chosen_file)

  local dir = "/home/kild/Documents/Projects/leetcode-nvim/algorithms/cplusplus/array/twosum/"
  local cpp_files = dir .. "main.cpp " .. dir .. "solution.h"
  local output_executable = dir .. "main"

  -- Comando para compilar o código C++
  local compile_command = "g++ -std=c++17 -o " .. output_executable .. " " .. cpp_files

  -- Compilar os arquivos
  local compile_result = vim.fn.system(compile_command)
  if compile_result ~= "" then
    vim.api.nvim_err_writeln("Erro ao compilar: " .. compile_result)
    return
  end

  -- Executar o programa compilado e capturar a saída
  local output = vim.fn.system(output_executable)
  if output == "" then
    vim.api.nvim_err_writeln("Nenhuma saída foi gerada.")
    return
  end

  -- Substituir o conteúdo do buffer atual pela saída da execução
  vim.api.nvim_buf_set_lines(current_buf, 0, -1, false, vim.split(output, "\n"))
end

return M
