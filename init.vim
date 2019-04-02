let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 1

fun! _My_deoplete_tab()
  if pumvisible()
    return "\<C-n>"
  endif
  let pos = getcurpos()
  let c = getline(pos[1])[pos[2]-2]
  echom string(pos) c
  if c =~ '\k'
    return deoplete#mappings#manual_complete()
  endif
  return "\<Tab>"
endfun
inoremap <silent><expr> <Tab> _My_deoplete_tab()
inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Toggle deoplete.
fun! _My_toggle_deoplete()
  let g:deoplete#disable_auto_complete = !g:deoplete#disable_auto_complete
endfun
noremap  <f5> :<C-u>call _My_toggle_deoplete()<cr>
inoremap <f5> <c-o>:call _My_toggle_deoplete()<cr>

" Via g:deoplete#_keyword_patterns
let g:deoplete#keyword_patterns = {
      \ '_': '[a-zA-Z_]\w*',
      \ 'vim': '[a-zA-Z_][\w#:_-]*'
      \ }

