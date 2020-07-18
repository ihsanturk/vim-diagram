"           ╭─────────────────────diagram.vim────────────────────╮
"           Maintainer:     ihsan, ihsanl[at]pm[dot]me           │
"           Description:    Draw diagram shapes.                 │
"           Last Change:    2020 Jul 18 16:00:05                 │
"           First Appeared: 2020 Jul 18 16:00:05                 │
"           License:        MIT                                  │
"           ╰────────────────────────────────────────────────────╯

" TODO: add feature: derive from visually selected.
" TODO: add padding argument.

" draw rounded box
function! s:makebox(...) abort
	let width = str2nr(a:1)
	let height = a:0 < 2 ? width : str2nr(a:2)
	let margin = a:0 > 2 ? str2nr(a:3) : 0
	let r_margin = repeat(' ', margin)
	" chars: │─⎡⎣⎤⎦╭╮
	let top = '╭'.repeat('─', width - 2).'╮'.r_margin
	let y = '│'.repeat(' ', width - 2).'│'.r_margin
	let bottom = '╰'.repeat('─', width - 2).'╯'.r_margin
	let lines = [top]
	call extend(lines, repeat([y], height - 2))
	call add(lines, bottom)
	call setreg('b', lines, 'b'.(width + margin))
endf
command! -nargs=+ MakeBox call s:makebox(<f-args>)

" TODO: define if has no mappings
nnoremap <leader>b mb$"bp`b

