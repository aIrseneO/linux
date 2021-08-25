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
\"/******************************************************************************/",
\"/*     Copyright (c) 2020 Arsene Temfack                                      */",
\"/*                                                                            */",
\"/*     SPDX-License-Identifier: MIT                                           */",
\"/******************************************************************************/",
\]
let MIT2 = [
\"################################################################################",
\"#     Copyright (c) 2020 Arsene Temfack                                        #",
\"#                                                                              #",
\"#     SPDX-License-Identifier: MIT                                             #",
\"################################################################################",
\]


" This function appends the License Notice to the file at line n
function! s:appendLicense(License, n)
	" Get the number of lines in the License Notice
	let l:LicenseLength = len(a:License) - 1
	
	" Empty line after the License
	call append(a:n, "")

	" Append the License
	while l:LicenseLength >= 0
		call append(a:n, a:License[l:LicenseLength])
		let l:LicenseLength = l:LicenseLength - 1
	endwhile
endfunction


" Bind License with Shortcut
" command! __Desired-Shortcut__ call s:append(__License-Name__)


" Bind Licenses with shortcuts
command! MIT1 call s:appendLicense(MIT1, 0)
command! MIT21 call s:appendLicense(MIT2, 0)
command! MIT22 call s:appendLicense(MIT2, 2)


" Map a key to License
map <F1> :MIT<CR>
