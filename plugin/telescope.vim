nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffer<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep For > ")})<cr>
nnoremap <leader>fgc :lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fgb :lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fgs :lua require('telescope.builtin').git_stash()<cr>

lua<<EOF
require('telescope').setup{
    defaults={
        layout_strategy="vertical",
        winblend=1,
    }
}
EOF
