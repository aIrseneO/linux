" Copyright (c) 2021 Arsene Temfack
"
" SPDX-License-Identifier: MIT


" Here is where License Notice Should be added:
" let s:__License-Name__ = [
" 
" License Notice...
"
" ]


" MIT License
let MIT = [
\"/*",
\"* Copyright (c) 2020 Arsene Temfack",
\"*",
\"* SPDX-License-Identifier: MIT",
\"*/"
\]


" This function appends the License to the beginning of the file
function! s:appendLicense(License)
	" Get the number of lines in the License Notice
	let l:LicenseLength = len(a:License) - 1
	
	" Empty line after the License
	call append(0, "")

	" Append the License
	while l:LicenseLength >= 0
		call append(0, a:License[l:LicenseLength])
		let l:LicenseLength = l:LicenseLength - 1
	endwhile
endfunction


" Bind License with Shortcut
" command! __Desired-Shortcut__ call s:append(__License-Name__)


" Bind Licenses with shortcuts
command! MIT call s:appendLicense(MIT)


" Map a key to License
map <F1> :MIT<CR>
