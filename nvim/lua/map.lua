local map = vim.keymap.set

map('n', '<esc>', '<cmd>noh<cr>') -- <esc> to noh
map('i', '<c-[>', '<c-[><cmd>update | lua vim.lsp.buf.format{async=true}<cr>')
map({ 'n', 'v' }, '$', '^') -- swap $ & ^
map({ 'n', 'v' }, '^', '$')
map({ 'n', 'v' }, ',', '@:') --repeat previous command
map({ 'i', 'v' }, '<c-n>', '<down>') --emacs keybind
map({ 'i', 'v' }, '<c-p>', '<up>')
map({ 'i', 'v' }, '<c-b>', '<left>')
map({ 'i', 'v' }, '<c-f>', '<right>')
map({ 'i', 'v' }, '<c-a>', '<home>')
map({ 'i', 'v' }, '<c-e>', '<end>')
map('i', '<c-d>', '<del>')
map('i', '<c-k>', '<right><c-c>v$hs')
map('i', '<c-u>', '<c-c>v^s')
map('i', '<a-d>', '<right><c-c>ves')
map('i', '<a-f>', '<c-right>')
map('i', '<a-b>', '<c-left>')
map({ 'n', 'v' }, '<tab>', require('todo-comments').jump_next)
map({ 'n', 'v' }, '<s-tab>', require('todo-comments').jump_prev)
map('n', '<cr>', ':Make ') -- execute shell command
map('n', '<s-cr>', ':!')
map({ 'i', 'n', 'v' }, '<a-left>', '<c-w><') -- change window size
map({ 'i', 'n', 'v' }, '<a-down>', '<c-w>+')
map({ 'i', 'n', 'v' }, '<a-up>', '<c-w>-')
map({ 'i', 'n', 'v' }, '<a-right>', '<c-w>>')
map('n', 't', require('telescope.builtin').builtin) -- Telescope
map('n', '<space>o', require('telescope.builtin').lsp_document_symbols)
map('n', '<space>d', require('telescope.builtin').diagnostics)
map('n', '<space>b', function()
	require('telescope.builtin').buffers { ignore_current_buffer = true }
end)
map('n', '<space>e', require('telescope').extensions.file_browser.file_browser)
map('n', '<space>f', require('telescope').extensions.frecency.frecency)
map('n', '<space>c', '<cmd>TodoTelescope<cr>')
map('n', '<space>n', require('telescope').extensions.notify.notify)
map({ 'n', 'v' }, '<space>a', '<cmd>Lspsaga code_action<cr>')
map('n', '<space>j', '<cmd>Lspsaga lsp_finder<cr>') --`j` stands for jump
map('n', '<space>r', '<cmd>Lspsaga rename<cr>')
map('n', '<space>h', '<cmd>Lspsaga hover_doc<cr>')
map({ 'n', 'v' }, '<c-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>')
map({ 'n', 'v' }, '<c-k>', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
