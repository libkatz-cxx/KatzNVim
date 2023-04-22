-- some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = 'yes'

-- autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup('CocGroup', {})
vim.api.nvim_create_autocmd('CursorHold', {
    group = 'CocGroup',
    command = 'silent call CocActionAsync("highlight")',
    desc = 'Highlight symbol under cursor on CursorHold'
})

-- setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd('FileType', {
    group = 'CocGroup',
    pattern = 'typescript,json',
    command = 'setl formatexpr=CocAction("formatSelected")',
    desc = 'Setup formatexpr specified filetype(s).'
})

-- update signature help on jump placeholder
vim.api.nvim_create_autocmd('User', {
    group = 'CocGroup',
    pattern = 'CocJumpPlaceholder',
    command = 'call CocActionAsync("showSignatureHelp")',
    desc = 'Update signature help on jump placeholder'
})

-- add `:Format` command to format current buffer
vim.api.nvim_create_user_command('Format', 'call CocAction("format")', {})

-- add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command('Fold', 'call CocAction("fold", <f-args>)', {nargs = '?'})

-- add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command('OR', 'call CocActionAsync("runCommand", "editor.action.organizeImport")', {})

-- add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function", "")}')