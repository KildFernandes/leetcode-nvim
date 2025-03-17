local buffer = require('utils.buffer')
-- Criar o comando :Submit()
-- vim.api.nvim_create_user_command("Submit", submit, {})

-- Chamar a função ao carregar o script
local base_dir = vim.fn.expand("%:p:h") .. "/algorithms/cplusplus/array"
buffer.create_floating_window(base_dir)
