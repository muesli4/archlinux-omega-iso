let g:airline#themes#softdark#palette = {}

let s:D2   = [ '#ffffff' , '#3a3a3a' , 231 , 237 ]
let s:D3   = [ '#6c6c6c' , '#262626' , 242 , 235 ]

let s:N1   = [ '#1c1c1c' , '#d75f5f' , 234 , 167 ]
let g:airline#themes#softdark#palette.normal = airline#themes#generate_color_map(s:N1, s:D2, s:D3)

" Here we define overrides for when the buffer is modified.  This will be
" applied after g:airline#themes#softdark#palette.normal, hence why only certain keys are
" declared.
let g:airline#themes#softdark#palette.normal_modified = {
      \ 'airline_c': [ '#ffffff' , '#8a8a8a' , 231     , 245      , ''     ] ,
      \ }

let s:I1 = [ '#1c1c1c' , '#5f87d7' , 234  , 68  ]
let g:airline#themes#softdark#palette.insert = airline#themes#generate_color_map(s:I1, s:D2, s:D3)
let g:airline#themes#softdark#palette.insert_modified = copy(g:airline#themes#softdark#palette.normal_modified)

" REPLACE - Same colors as INSERT
let g:airline#themes#softdark#palette.replace = copy(g:airline#themes#softdark#palette.insert)
let g:airline#themes#softdark#palette.replace_modified = copy(g:airline#themes#softdark#palette.normal_modified)

" VISUAL - A bit more agressive with bright colors
let s:V1 = [ '#5f87d7' , '#ffffff' , 68 , 231 ]
let g:airline#themes#softdark#palette.visual = airline#themes#generate_color_map(s:V1, s:D2, s:D3)
let g:airline#themes#softdark#palette.visual_modified = copy(g:airline#themes#softdark#palette.normal_modified)

" INACTIVE
let s:IA1 = [ '#ffffff' , '#262626' , 231 , 235 , '' ]
let g:airline#themes#softdark#palette.inactive = airline#themes#generate_color_map(s:IA1, s:D2, s:D3)
let g:airline#themes#softdark#palette.inactive_modified = {
      \ 'airline_c': [ '#ffffff' , '#8a8a8a' , 231     , 245      , ''     ] ,
      \ }

" Warning and error
let g:airline#themes#softdark#palette.normal.airline_warning = s:N1
let g:airline#themes#softdark#palette.normal_modified.airline_warning = s:N1
let g:airline#themes#softdark#palette.normal.airline_error = s:N1
let g:airline#themes#softdark#palette.normal_modified.airline_error = s:N1
let g:airline#themes#softdark#palette.insert.airline_warning = s:I1
let g:airline#themes#softdark#palette.insert_modified.airline_warning = s:I1
let g:airline#themes#softdark#palette.insert.airline_error = s:I1
let g:airline#themes#softdark#palette.insert_modified.airline_error = s:I1
let g:airline#themes#softdark#palette.visual.airline_warning = s:V1
let g:airline#themes#softdark#palette.visual_modified.airline_warning = s:V1
let g:airline#themes#softdark#palette.visual.airline_error = s:V1
let g:airline#themes#softdark#palette.visual_modified.airline_error = s:V1

