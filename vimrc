function VimBuild(cmd)
	let curdir = getcwd()

	while !filereadable('.vimbuild') && getcwd() != '/'
		execute 'cd ..'
	endwhile

	if filereadable('.vimbuild')
		execute '!./.vimbuild ' . a:cmd
	endif

	execute 'cd ' . curdir
endfunction

set number
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

nnoremap zxc :call VimBuild("clean") <CR>
nnoremap zxb :call VimBuild("build") <CR>
nnoremap zxr :call VimBuild("run") <CR>
nnoremap zxd :call VimBuild("debug") <CR>
nnoremap zxs :call VimBuild("size") <CR>

set tags=./tags;
