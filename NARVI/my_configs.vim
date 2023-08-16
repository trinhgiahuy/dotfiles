
let g:tagbar_ctags_bin = '/home/bdgitr/.vim_runtime/my_plugins/ctags/ctags'


"Fix error Terminal capability cm required
"if $TERM ~= 'xterm'
"    export term=xterm
"endif

"set numbennoremap <Leader>nc: NERDTreeClose<CR>r 
"set relativenumber
set rnu nu

"TODO: Add keybind for copy hightlight text
"nnoremap <leader>c vE"by"


"===============BASIC COMMAND FOR VIM======================


"===============TABS======================
"set showtabline=2
"highlight TabLineSel ctermfg=red ctermbg=darkgray guifg=red guibg=darkgray
"set laststatus=2
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"RANGER INTEGRATION 
nnoremap <Leader>rc :RangerCurrentDirectory<CR>
nnoremap <Leader>rt :RangerCurrentDirectoryNewTab<CR>
" Show hidden file
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" TODO: Write NERDTree CMD HERE, ? to view command
"i: vsplit, gi: preview
"s: hsplit, gs: preview
"C: Change selected dir to Root Dir

" open ranger when vim open a directory instead of nerdtree
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

"MOVE BETWEEN TABS
nnoremap <S-l> :tabnext<CR>
nnoremap <S-h> :tabprevious<CR>
nnoremap <S-t>n :tabnew<CR>
nnoremap <S-t>1 :tabnext 1<CR>
nnoremap <S-t>2 :tabnext 2<CR>
nnoremap <S-t>3 :tabnext 3<CR>
nnoremap <S-t>4 :tabnext 4<CR>
nnoremap <S-t>5 :tabnext 5<CR>

nnoremap <S-t>6 :tabnext 6<CR>
nnoremap <S-t>7 :tabnext 7<CR>
nnoremap <S-t>8 :tabnext 8<CR>
nnoremap <S-t>9 :tabnext 9<CR>
nnoremap <S-t>10 :tabnext 10<CR>
"=========S=====TAGBAR======================

nnoremap <Leader>t :TagbarToggle<CR>
"nnoremap <Leader>c :TagbarClose<CR>

let g:tagbar_autofocus = 1
let g:tagbar_width = 30
let g:tagbar_show_linenumbers = 1

"============================================
"Show hidden files in NERDTREE
let NERDTreeShowHidden = 1


"Open NERDTREE
nnoremap <Leader>n :NERDTreeToggle<CR>

"Open a file from NERDTree in a new tab
"nnoremap <Leader>ne :NERDTreeFind<CR>

"Resize NerdTree pane left/right
nnoremap <Leader>h :vertical resize +5<CR>
nnoremap <Leader>l :vertical resize -5<CR>

"Resize NERDTree pane up/down
nnoremap <Leader>j :resize +3<CR>
nnoremap <Leader>k :resize -3<CR>


"??Open file in new window
let g:NERDTreeMapActivateNodeVerticalSplit = 'w'

"Close current window/tab
nnoremap <Leader>c :close<CR>

"Window seperators
set fillchars+=vert:\|
set fillchars+=fold:\|
set fillchars+=diff:\|


"set fillchars+=vert:\=
"set fillchars+=fold:\= "set fillchars+=diff:\= 























"Function to comment/uncomment C-like languages (C, C++, Java, etc.)
"function! ToggleCStyleComment()
"    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
"        let comment_string = '//'
"    elseif &filetype == 'python'
"        let comment_string = '#'
"    else
"        " Add more cases for other languages if needed
"        return
"    endif
"
"    let l:comment_type = ''
"    let l:selection_start = getpos("'<")
"    let l:selection_end = getpos("'>")
"
"    " If the first line in the selection is already commented, we assume the entire
"    " selection is commented, and we should uncomment it.
"    if getline(l:selection_start[1]) =~? '^\s*' . comment_string
"        let l:comment_type = 'uncomment'
"    else
"        let l:comment_type = 'comment'
"    endif
"
"    execute l:selection_start[1] . ',' . l:selection_end[1] . 's#^\(\s*\)\(\S\)#\1' . (l:comment_type == 'comment' ? comment_string . ' \2' : '') . '#'
"endfunction
"
"" Key binding to toggle comments for the selected block
"vnoremap <Leader>. :<C-u>call ToggleCStyleComment()<CR>
"
"
"" Map <Leader>/ in Visual mode to comment/uncomment lines
""vnoremap <Leader>. :<C-u>call CommentToggle()<CR>
"
"function! CommentToggle() abort
"    let l:start = line("'<")
"    let l:end = line("'>")
"
"    " Loop through the selected lines
"    for l:line in range(l:start, l:end)
"        " Check if the line is already commented
"        if getline(l:line) =~# '^\s*//'
"            " Uncomment the line
"            execute l:line . 's/^\s*\/\//'
"        else
"            " Comment the line
"            execute l:line . 's/^/\/\/'
"        endif
"    endfor
"
"    " Move the cursor back to the original position
"    normal! `[
"endfunction


 "Set a mapping for <Space> followed by any text
 vnoremap <Space> :<C-u>call InputAndInsertComment()<CR>

 function! InputAndInsertComment() abort
     let l:comment = input("Comment pattern: ")
     if l:comment != ""
         "Escape any special characters in the comment pattern
         let l:escaped_comment = escape(l:comment, '/\')
         echom 'The escaped comment pattern is: ' . l:escaped_comment

         let l:selection_start = line("'<")"'")
         let l:selection_end = line("'>")"'")
         for l:line in range(l:selection_start, l:selection_end)
             execute l:line . 's/^/' . l:escaped_comment . '/'
         endfor
         
         " Insert the comment pattern at the beginning of each line
         " execute "normal! V:s/^/" . l:escaped_comment . "/"
     endif
 endfunction

" Function to kill register content
nnoremap <Leader>kr :<C-u>call KillRegister()<CR>

function! KillRegister() abort
    let l:registerName = input("Register name: ")
    echom 'Null the content of register: ' . l:registerName
    execute l:line . 'let ' . l:registerName .'= \''\'
endfunction
