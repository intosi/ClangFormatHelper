let s:script_folder_path = escape( expand( '<sfile>:p:h' ), '\'   )

fun! ClFormat()
    if !executable(g:clang_format_path)
        return
    endif

    if v:count == 0
        let l:lines='all'
    else
        let l:lines=printf('%s:%s', v:lnum, v:lnum+v:count-1)
    endif

    execute('pyf '.s:script_folder_path.'../clang-format.py')
endf

let g:cfh_format_on_save = get(g:, 'cfh_format_on_save', 0)
let g:clang_format_path = get(g:, 'clang_format_path', 'clang-format')

augroup CFH
if g:clighter8_format_on_save == 1
    au BufWritePre * call ClFormat()
au FileType c,cpp set formatexpr=ClFormat()
endif END

