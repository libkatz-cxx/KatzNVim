-- [[ tabs ]] --
-- tab == 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- enable smart indent
vim.opt.smartindent = true

-- [[ search ]] --
-- ignore case when searching
vim.opt.ignorecase = true

-- don't ignore case, if there are uppercase characters
vim.opt.smartcase = true

-- highlight found text objects
vim.opt.showmatch = true

-- [[ splits ]] --
-- vertical splits become right
vim.opt.splitright = true

-- horizontal splits bottom
vim.opt.splitbelow = true

--[[ additional ]]--
-- use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- disable the addition of files at the end
vim.opt.fixeol = false

-- autocomplete (built-in Neovim)
vim.opt.completeopt = 'menuone,noselect'

-- don't autocomment new lines when switching to a new line
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]