" define prefix dictionary
let g:lmap={}

" git menu
let g:lmap.g={
              \'name' : 'Git',
              \'s' : ['Gstatus', 'Status'],
              \'p' : ['Gpull', 'Pull'],
              \'u' : ['Gpush', 'Push'],
              \'c' : ['Gcommit', 'Commit'],
              \'w' : ['Gwrite', 'Write'],
              \'d' : ['Gdiff', 'Diff'],
              \'l' : ['Glog', 'Log'],
              \'f' : ['Gfetch', 'Fetch'],
              \'b' : ['Gblame', 'Blame'],
              \'k' : ['Gitv', 'Gitk']
              \}

" gitgutter hunks menu
let g:lmap.g.h={
                \'name' : 'Hunks',
                \'p' : ['call feedkeys("\<Plug>GitGutterPreviewHunk")', 'Preview'],
                \'u' : ['call feedkeys("\<Plug>GitGutterUndoHunk")', 'Undo'],
                \'s' : ['call feedkeys("\<Plug>GitGutterStageHunk")', 'Stage']
                \}

" nerdcommenter menu
let g:lmap.c={
              \'name' : 'Comments',
              \' ' : ['call feedkeys("\<Plug>NERDCommenterToggle")', 'Toggle'],
              \'$' : ['call feedkeys("\<Plug>NERDCommenterToEOL")', 'From cursor to EOL'],
              \'a' : ['call feedkeys("\<Plug>NERDCommenterAltDelims")', 'Switch to alternate delimiters'],
              \'A' : ['call feedkeys("\<Plug>NERDCommenterAppend")', 'Add comment at EOL'],
              \'b' : ['call feedkeys("\<Plug>NERDCommenterAlignBoth")', 'Aligned both sides'],
              \'c' : ['call feedkeys("\<Plug>NERDCommenterComment")', 'Comment'],
              \'i' : ['call feedkeys("\<Plug>NERDCommenterInvert")', 'Toggle selected line(s)'],
              \'l' : ['call feedkeys("\<Plug>NERDCommenterAlignLeft")', 'Aligned left side'],
              \'m' : ['call feedkeys("\<Plug>NERDCommenterMinimal")', 'Minimal'],
              \'n' : ['call feedkeys("\<Plug>NERDCommenterNested")', 'Nested'],
              \'s' : ['call feedkeys("\<Plug>NERDCommenterSexy")', 'Sexy'],
              \'u' : ['call feedkeys("\<Plug>NERDCommenterUncomment")', 'Uncomment'],
              \'y' : ['call feedkeys("\<Plug>NERDCommenterYank")', 'Yank & comment']
              \}

" test menu
let g:lmap.e={
              \'name' : 'Test',
              \'t' : ['TestNearest', 'Nearest'],
              \'T' : ['TestFile', 'This file'],
              \'a' : ['TestSuite', 'All'],
              \'l' : ['TestLast', 'Last'],
              \'g' : ['TestVisit', 'Open test file']
              \}

" toggles
let g:lmap.t={
              \'name' : 'Toggles',
              \'l' : ['LToggle', 'Location list'],
              \'q' : ['call asyncrun#quickfix_toggle(8)', 'Quickfix window'],
              \'N' : ['NERDTreeToggle', 'NERDTree'],
              \'t' : ['TagbarToggle', 'Tagbar'],
              \'n' : ['NumbersToggle', 'Numbers'],
              \'u' : ['UndotreeToggle', 'Undotree']
              \}

" searches
let g:lmap.a=['Ag', 'ag search']
if has('mac')
    let g:lmap.d=['Dash', 'Dash search']
endif

" fzf
let g:lmap.f={
              \'name' : 'Fuzzy search',
              \'f' : ['Files', 'Files'],
              \'g' : ['GFiles', 'Git files'],
              \'b' : ['Buffers', 'Open buffers'],
              \'l' : ['Lines', 'Lines in loaded buffers'],
              \'c' : ['Commits', 'Git commits'],
              \'t' : ['Tags', 'Tags in project'],
              \'h' : ['History', 'History'],
              \'o' : ['Commands', 'Commands'],
              \'m' : ['Maps', 'Normal mode mappings'],
              \'e' : ['Helptags', 'Help tags'],
              \'y' : ['Filetypes', 'File types']
              \}

" format easymotion description
let s:value_lookup={
                    \'<Plug>(easymotion-prefix)': 'Easymotion prefix'
                    \}
function! s:my_displayfunc()
    let g:leaderGuide#displayname=
            \get(s:value_lookup, g:leaderGuide#displayname,
            \g:leaderGuide#displayname)
endfunction
let g:leaderGuide_displayfunc=[function('s:my_displayfunc')]

call leaderGuide#register_prefix_descriptions("\\", 'g:lmap')
nnoremap <silent> <leader> :<c-u>LeaderGuide '<leader>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<leader>'<CR>
