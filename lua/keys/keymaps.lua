local map = vim.api.nvim_set_keymap 
local opt = {noremap = true}

-- [[ methods for configuration hotkeys ]] --
-- <string> key - string with hotkey
-- <string> command - string with command
-- <list> options - list with options
-- (normal) --
function nm(key, command, options)
	map('n', key, command, options)
end

-- (input) --
function im(key, command, options)
	map('i', key, command, options)
end

-- (visual) --
function vm(key, command, options)
	map('v', key, command, options)
end

-- (terminal) --
function tm(key, command, options)
	map('t', key, command, options)
end

-- (visual mode) --
function xm(key, command, options)
	map('x', key, command, options)
end

-- set <leader> key
vim.g.mapleader = ' '                                             -- use space how leader key

-- [[ NvimTree ]] --
nm('<leader>v', '<cmd>NvimTreeOpen<CR>', opt)
nm('<leader>V', '<cmd>NvimTreeClose<CR>', opt)

-- [[ Telescope ]] --
nm('<leader>s', '<cmd>Telescope live_grep<CR>', opt)                   -- search a line

-- [[ BufferLine ]] --
nm('<leader>K', '<cmd>bd<CR>', opt)                                    -- close buffer
nm('<leader>]', '<cmd>BufferLineCyclePrev<CR>', opt)                   -- go to next buffer
nm('<leader>[', '<cmd>BufferLineCycleNext<CR>', opt)                   -- go to previous buffer
nm('<leader><S-Left>[', '<cmd>BufferLineMoveNext<CR>', opt)            -- close left buffer  
nm('<leader><S-Left>]', '<cmd>BufferLineMovePrev<CR>', opt)            -- close right buffer

-- [[ CoC.nvim ]] --
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
im('<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
im('<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : '\<C-h>']], opts)
-- make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
im('<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- use <c-space> to trigger completion
im('<c-space>', 'coc#refresh()', {silent = true, expr = true})

-- use `[g` and `]g` to navigate diagnostics
-- use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nm('[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
nm(']g', '<Plug>(coc-diagnostic-next)', {silent = true})

-- GoTo code navigation
nm('gd', '<Plug>(coc-definition)', {silent = true})
nm('gy', '<Plug>(coc-type-definition)', {silent = true})
nm('gi', '<Plug>(coc-implementation)', {silent = true})
nm('gr', '<Plug>(coc-references)', {silent = true})

-- use "sd" to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
nm('sd', '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- apply codeAction to the selected region
-- example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
xm('<leader>a', '<Plug>(coc-codeaction-selected)', opts)
nm('<leader>a', '<Plug>(coc-codeaction-selected)', opts)

-- remap keys for apply code actions at the cursor position.
nm('<leader>ac', '<Plug>(coc-codeaction-cursor)', opts)
-- remap keys for apply code actions affect whole buffer.
nm('<leader>as', '<Plug>(coc-codeaction-source)', opts)
-- remap keys for applying codeActions to the current buffer
nm('<leader>ac', '<Plug>(coc-codeaction)', opts)
-- apply the most preferred quickfix action on the current line.
nm('<leader>q', '<Plug>(coc-fix-current)', opts)

-- remap keys for apply refactor code actions.
nm('<leader>re', '<Plug>(coc-codeaction-refactor)', { silent = true })
xm('<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })
nm('<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })

-- run the Code Lens actions on the current line
nm('<leader>cl', '<Plug>(coc-codelens-action)', opts)

-- remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
nm('<C-f>', "coc#float#has_scroll() ? coc#float#scroll(1) : '<C-f>'", opts)
nm('<C-b>', "coc#float#has_scroll() ? coc#float#scroll(0) : '<C-b>'", opts)
im('<C-f>',
       "coc#float#has_scroll() ? '<c-r>=coc#float#scroll(1)<cr>' : '<Right>'", opts)
im('<C-b>',
       "coc#float#has_scroll() ? '<c-r>=coc#float#scroll(0)<cr>' : '<Left>'", opts)
vm('<C-f>', "coc#float#has_scroll() ? coc#float#scroll(1) : '<C-f>'", opts)
vm('<C-b>', "coc#float#has_scroll() ? coc#float#scroll(0) : '<C-b>'", opts)


-- use CTRL-S for selections ranges
-- requires 'textDocument/selectionRange' support of language server
nm('<C-s>', '<Plug>(coc-range-select)', {silent = true})
xm('<C-s>', '<Plug>(coc-range-select)', {silent = true})

-- mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- show all diagnostics
nm('A', ':<C-u>CocList diagnostics<cr>', opts)
-- manage extensions
nm('E', ':<C-u>CocList extensions<cr>', opts)
-- show commands
nm('C', ':<C-u>CocList commands<cr>', opts)
-- find symbol of current document
nm('<space>o', ':<C-u>CocList outline<cr>', opts)