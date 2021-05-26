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
let MIT1 = [
\"/*",
\"* Copyright (c) 2020 Arsene Temfack",
\"*",
\"* SPDX-License-Identifier: MIT",
\"*/"
\]
let MIT2 = [
\"#",
\"# Copyright (c) 2020 Arsene Temfack",
\"#",
\"# SPDX-License-Identifier: MIT",
\"#"
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
command! MIT1 call s:appendLicense(MIT1)
command! MIT2 call s:appendLicense(MIT2)


" Map a key to License
map <F1> :MIT<CR>
