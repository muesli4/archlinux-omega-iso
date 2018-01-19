" Vim color file - softdark
set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

set t_Co=256
let g:colors_name = "softdark"

" TODO same color for comment and line numbers

" TODO C: cString cformat


" This colorscheme uses about 6 colors:
"   1. #d75f5f 167 default red
"   2. #5f87d7 68  default blue
"   3. #FFFFFF 231
"   4. #1e1e1e (no terminal match)
"   5. #262626 235 (cursor line, cursor column)
"   6. #8a8a8a 245
"   7. #6c6c6c 242 (comments and line numbers)
"   8. #1c1c1c 234 (background)
"   9. #dadada 253 (status line fg)
"  10. #3a3a3a 237 (status line bg)
hi Search guibg=white guifg=black ctermbg=231
" FIXME does not work for some reason
hi IncSearch guibg=white guifg=black guisp=NONE gui=NONE ctermbg=231
hi clear Visual
hi link Visual Search
hi WildMenu guibg=#d75f5f guifg=#FFFFFF ctermfg=231 ctermbg=167
hi SignColumn guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi link SpecialComment Comment
hi Typedef guifg=#d75f5f guibg=NONE guisp=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
hi Title guifg=#f6f3e8 guibg=NONE guisp=NONE gui=bold ctermbg=NONE cterm=bold
hi Folded guifg=#a0a8b0 guibg=#384048 guisp=#384048 gui=NONE
hi PreCondit guifg=#d75f5f guibg=NONE guisp=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
hi Include guifg=NONE guibg=NONE guisp=NONE gui=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
"hi TabLineSel -- no settings --
hi StatusLineNC guifg=#939395 guibg=#303030 guisp=#303030 gui=NONE
"hi CTagsMember -- no settings --
hi NonText guifg=#262626 guibg=NONE gui=NONE ctermfg=235 ctermfg=235 ctermbg=NONE
"hi CTagsGlobalConstant -- no settings --
"hi DiffText -- no settings --
hi ErrorMsg guifg=#d75f5f guibg=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
"hi Ignore -- no settings --
hi Debug guifg=#d75f5f guibg=NONE guisp=NONE gui=NONE ctermbg=NONE ctermfg=231
hi PMenuSbar guifg=NONE guibg=#202020 guisp=#202020 gui=NONE ctermfg=NONE
hi Identifier guifg=#5f87d7 guibg=NONE guisp=NONE gui=NONE ctermfg=68 ctermbg=NONE
hi SpecialChar guifg=#d75f5f guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE
hi Conditional guifg=#d75f5f guibg=NONE guisp=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
hi StorageClass guifg=white guibg=NONE guisp=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi Todo guifg=#8a8a8a guibg=NONE guisp=NONE gui=bold ctermfg=245 ctermbg=NONE cterm=bold
hi Special guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
hi LineNr guifg=#6c6c6c guibg=NONE guisp=#202020 gui=NONE ctermfg=242 ctermbg=NONE
" TODO make the selected item also bold
hi StatusLine guifg=#dadada guibg=#3a3a3a gui=bold ctermfg=253 ctermbg=237 cterm=bold
hi Normal guifg=white guibg=#1c1c1c guisp=#202020 gui=NONE ctermfg=231 ctermbg=234
hi Label guifg=white guibg=NONE guisp=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
"hi CTagsImport -- no settings --
hi PMenuSel guifg=white guibg=#d75f5f guisp=#d75f5f gui=NONE ctermfg=231 ctermbg=167
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=white guibg=NONE guisp=NONE gui=NONE ctermfg=231 ctermbg=NONE
hi Statement guifg=#d75f5f guibg=NONE guisp=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Comment guifg=#6c6c6c guibg=NONE guisp=#1c1c1c gui=NONE ctermfg=242 ctermbg=NONE
hi Character guifg=#5f87d7 guibg=NONE guisp=NONE gui=NONE ctermfg=68 ctermbg=NONE
hi Float guifg=#5f87d7 guibg=NONE guisp=NONE gui=bold ctermfg=68 ctermbg=NONE cterm=bold
hi Number guifg=#5f87d7 guibg=NONE guisp=NONE gui=bold ctermfg=68 ctermbg=NONE cterm=bold
hi Boolean guifg=#5f87d7 guibg=NONE guisp=NONE gui=bold ctermfg=68 ctermbg=NONE cterm=bold
hi Operator guifg=#8a8a8a guibg=NONE guisp=NONE gui=bold ctermfg=245 ctermbg=NONE cterm=bold
hi CursorLine guifg=NONE guibg=#262626  gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi CursorLineNr guifg=#5f87d7 guibg=#262626 gui=bold ctermfg=68 ctermbg=235 cterm=bold
"hi Union -- no settings --
"hi TabLineFill -- no settings --
hi Question guifg=#5f87d7 guibg=NONE gui=bold ctermfg=68 ctermbg=NONE cterm=bold
"hi WarningMsg -- no settings --
"hi VisualNOS -- no settings --
"hi ModeMsg -- no settings --
hi CursorColumn guifg=NONE guibg=#262626 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi Define guifg=#d75f5f guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE
hi Function guifg=#5f87d7 guibg=NONE guisp=NONE gui=NONE ctermfg=68 ctermbg=NONE
"hi FoldColumn -- no settings --
hi PreProc guifg=white guibg=NONE guisp=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
"hi EnumerationName -- no settings --
"hi MoreMsg -- no settings --
"hi SpellCap -- no settings --
hi VertSplit guifg=#6c6c6c guibg=#303030 guisp=#303030 gui=NONE ctermfg=242
hi Exception guifg=white guibg=NONE guisp=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi Keyword guifg=#dadada guibg=NONE guisp=NONE gui=bold ctermbg=NONE cterm=bold
hi Type guifg=#FFFFFF guibg=NONE guisp=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi Cursor guifg=white guibg=#d75f5f guisp=white gui=NONE ctermfg=231 ctermbg=167
"hi SpellLocal -- no settings --
hi Error guifg=#d75f5f guibg=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
hi PMenu guifg=#ffffff guibg=#202020 guisp=#202020 gui=NONE
hi SpecialKey guifg=#808080 guibg=#343434 guisp=#343434 gui=NONE
hi Constant guifg=#5f87d7 guibg=NONE guisp=NONE gui=bold ctermfg=68 ctermbg=NONE cterm=bold
"hi DefinedName -- no settings --
hi Tag guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
hi String guifg=#5f87d7 guibg=NONE guisp=NONE gui=NONE ctermfg=68 ctermbg=NONE
hi PMenuThumb guifg=NONE guibg=#303030 guisp=#303030 gui=NONE ctermfg=NONE
hi MatchParen guifg=#5f87d7 guibg=#202020 guisp=#202020 gui=bold ctermfg=68 cterm=bold
"hi LocalVariable -- no settings --
hi Repeat guifg=white guibg=NONE guisp=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
hi Directory guifg=#5f87d7 ctermfg=68
hi Structure guifg=#d75f5f guibg=NONE guisp=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
hi Macro guifg=#d75f5f guibg=NONE guisp=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
"hi Underlined -- no settings --
"hi TabLine -- no settings --
hi cursorim guifg=#404040 guibg=#8b8bff guisp=#8b8bff gui=NONE
"hi clear -- no settings --
hi link constant Constant
" hi lcursor guifg=#404040 guibg=#8fff8b guisp=#8fff8b gui=NONE
" hi preproc guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE
" hi incsearch guifg=#f0f0f0 guibg=#806060 guisp=#806060 gui=NONE
" hi linenr guifg=#686868 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi moremsg guifg=#489000 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi mbenormal guifg=#cfbfad guibg=#2e2e3f guisp=#2e2e3f gui=NONE
" hi perlspecialstring guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE
" hi doxygenspecial guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi mbechanged guifg=white guibg=#2e2e3f guisp=#2e2e3f gui=NONE ctermfg=231
" hi mbevisiblechanged guifg=white guibg=#4e4e8f guisp=#4e4e8f gui=NONE ctermfg=231
" hi doxygenparam guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi doxygensmallspecial guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi doxygenprev guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi perlspecialmatch guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE
" hi cformat guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE
" hi doxygenspecialmultilinedesc guifg=#ad600b guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi taglisttagname guifg=#808bed guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi doxygenbrief guifg=#fdab60 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi mbevisiblenormal guifg=#cfcfcd guibg=#4e4e8f guisp=#4e4e8f gui=NONE
" hi user2 guifg=#7070a0 guibg=#3e3e5e guisp=#3e3e5e gui=NONE
" hi user1 guifg=#00ff8b guibg=#3e3e5e guisp=#3e3e5e gui=NONE
" hi doxygenspecialonelinedesc guifg=#ad600b guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi doxygencomment guifg=#ad7b20 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi cspecialcharacter guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE

hi DiffAdd      guifg=#5f87d7   guibg=NONE  gui=bold ctermfg=68 ctermbg=NONE cterm=bold
hi DiffChange   guifg=white     guibg=NONE  gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi DiffDelete   guifg=#d75f5f   guibg=NONE  gui=bold ctermfg=167 ctermbg=NONE cterm=bold

" Plugin specific
" vim-gitgutter
hi link GitGutterAdd DiffAdd
hi link GitGutterChange DiffChange
hi link GitGutterDelete DiffDelete
hi link GitGutterChangeDelete DiffDelete
" Language specific
" Scheme
hi schemeFunc guifg=white ctermfg=231

" Python
" hi pythonimport guifg=#009000 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi pythonexception guifg=white guibg=NONE guisp=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
" hi pythonbuiltinfunction guifg=#009000 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE
" hi pythonoperator guifg=white guibg=NONE guisp=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
" hi pythonexclass guifg=#009000 guibg=NONE guisp=NONE gui=NONE ctermbg=NONE

" HTML
hi htmlitalic guifg=NONE guibg=NONE guisp=NONE gui=italic ctermfg=NONE ctermbg=NONE
hi htmlboldunderlineitalic guifg=NONE guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlbolditalic guifg=NONE guibg=NONE guisp=NONE gui=bold,italic ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlunderlineitalic guifg=NONE guibg=NONE guisp=NONE gui=italic,underline ctermfg=NONE ctermbg=NONE
hi htmlbold guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlboldunderline guifg=NONE guibg=NONE guisp=NONE gui=bold,underline ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlunderline guifg=NONE guibg=NONE guisp=NONE gui=underline ctermfg=NONE ctermbg=NONE

