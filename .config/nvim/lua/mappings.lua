local map = vim.keymap.set
local nv = { 'n', 'v' }
local conf_home = os.getenv 'XDG_CONFIG_HOME'
local clr_rndm
if conf_home then
	clr_rndm = conf_home .. '/nvim/lua/color_randomizer.lua'
else
	clr_rndm = '~/.config/nvim/lua/color_randomizer.lua'
end

map(nv, ':', ';') --exchange : & ;
map(nv, ';', ':')
map('n', '<esc>', ':noh<cr>') --<esc> to noh
map('n', 'W', 'wi') --move & insert
map('n', 'E', 'ea')
map('n', 'B', 'bi')
map('n', '<a-k>', ':bprev<cr>') --buffer
map('n', '<a-j>', ':bnext<cr>')
map('n', '<up>', '"zdd<up>"zP') --move line
map('n', '<down>', '"zdd"zp')
map('v', '<up>', '"zx<up>"zP`[V`]')
map('v', '<down>', '"zx"zp`[V`]')
--ideas:mapping something to <left> & <right> in normal mode
--map('n', 'm', ':w<cr>:make<cr>') --make shortcut
map(nv, ',', '@:') --like '.', repeat previous command

--use <tab> instead <space> with neither lsp nor fuzzy commands
map('n', '<tab>b',
	[[<cmd> lua if vim.o.background=='dark' then vim.o.background='light' else vim.o.background='dark' end<cr>]])
map('n', '<tab>r', '<cmd> e $MYVIMRC<cr>')
map('n', '<tab>w', '<cmd> wa | lua vim.lsp.buf.format{ async = true }<cr>')
map('n', '<tab>d', '<cmd> bd<cr>')
map('n', '<tab>c', '<cmd> so ' .. clr_rndm .. '<cr>')

--emacs keybind
map('i', '<c-n>', '<down>')
map('i', '<c-p>', '<up>')
map('i', '<c-b>', '<left>')
map('i', '<c-f>', '<right>')
map('i', '<c-a>', '<c-c>^i')
map('i', '<c-e>', '<end>')
map('i', '<c-d>', '<del>')
map('i', '<c-k>', '<right><c-c>v$hs')
map('i', '<c-t>', '<c-c><left>"zx"zpa')
map('i', '<c-y>', '<c-r>"')
map('i', '<a-d>', '<c-c>ciw')
map('i', '<a-f>', '<c-right>')
map('i', '<a-b>', '<c-left><left>')

--split pane and change size
map(nv, '<', '<c-w>W')
map(nv, '>', '<c-w>w')
map(nv, '_', ':<c-u>sp<cr>')
map(nv, '<bar>', ':<c-u>vs<cr>')
map(nv, '`', '<c-w>>')
map(nv, '-', '<c-w><')
map(nv, '\\', '<c-w>+')
map(nv, '=', '<c-w>-')

--Telescope
map('n', '<space>e', [[<cmd>Telescope file_browser<cr>]])
map('n', '<space>t', [[<cmd>Telescope<cr>]])
map('n', '<space>f', [[<cmd>Telescope frecency<cr>]])
map('n', '<space>o', [[<cmd>Telescope lsp_document_symbols<cr>]])
map('n', '<space>r', [[<cmd>Telescope lsp_references<cr>]])

--lspsaga
map("n", "<space>a", "<cmd>Lspsaga code_action<CR>")
map("v", "<space>a", "<cmd>Lspsaga range_code_action<CR>")
map("n", "<space>n", "<cmd>Lspsaga rename<CR>")
map("n", "<c-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "<c-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "<space>h", "<cmd>Lspsaga hover_doc<CR>")
map("n", "<A-t>", "<cmd>Lspsaga open_floaterm<CR>")
map("t", "<A-t>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
