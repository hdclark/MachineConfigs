"Coloured Syntax (the if tests if colours are available
"in the current terminal. 
if &t_Co > 1
    syntax enable
endif

"Syntax highlighting: On a slower computer (or terse LaTeX code) vim seems to choke.
" Shrinking highlighting zones to speed things up. Remove these if they are problematic.
" NOTE: Didn't seem to work. Need to investigate further.
" For now, I am just disabling the LaTeX syntax highlighting by running vim -u NONE
":syn sync maxlines=200
":syn sync minlines=50

"Turn off all LaTeX highlighting errors. Helpful if using packages with weird syntax.
"let tex_no_error=1

set history=5000

"------Restore the cursor to the previous location-----------
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Highlighting search results.
:set hlsearch


" F2 to wrap the current paragraph to whatever `tw` is set to.
" To set a per-file `tw`, put the following at the bottom:
"    % vim: set wrap tw=80:
" Explanation:
"   1. nnoremap   -- Ensure you're in normal mode.
"   2. <F2>       -- This is the keypress required to perform the action.
"   3. {          -- Go to the beginning of the current paragraph.
"   4. gq         -- Reflow text, breaking on spaces and shortening double-spaces.
"   5. }          -- Repeat the previous action until the end of the paragraph.
nnoremap <F2> {gq}

" Append these four lines to your ~/.vimrc . Found at http://vim.wikia.com/wiki/Moving_lines_up_or_down
" F3 and F4 to move the current line up or down.
nnoremap <F3> :m .+1<CR>==
nnoremap <F4> :m .-2<CR>==

" Toggle on/off autoindentation. Useful to disable for pasting via X primary buffer.
nnoremap <F5> :set autoindent!<CR>

" Run a local script called './compile.sh'. Nice for LaTeX and C++.
map  <silent> <F6> :silent execute "!./compile.sh &>/dev/null & "<CR>:redraw!<CR>

nnoremap <F7> :call Disciplinarian_Load_File()<CR>

" Search for today's datestamp. Useful for jumping to today in disciplinarian.
nnoremap <F8> :let @a = system("echo -n $(date '+%Y%m%_0d')")<CR>:execute '/' . @a <CR>

nnoremap <F9>  :read !printf 'Work Began = ' ; date '+\%Y\%m\%d-\%H\%M\%S'<CR>
nnoremap <F10> :read !printf 'Work Ended = ' ; date '+\%Y\%m\%d-\%H\%M\%S'<CR>

"Send the current line to mplayer to play (treats as a filename.) Play a 5-second
" clip and then exit. If the screen is black/empty after running, hit CTRL+L to refresh.
" 
" NOTE: Maybe instead of   ...  'doublequotes .       getline(".")        . doublequotes' ...
" I should have            ...   doublequotes . shellescape(getline('.')) . doublequotes  ...
" I think it would be safer that way (handling extra whitespace at the end, etc..)
"map  <silent> <F5> :silent execute "!mplayer -really-quiet -vo null  -endpos 5 -ss 40  '" . getline(".") . "' &>/dev/null & "<CR>:redraw!<CR> 
"map  <silent> <F6> :silent execute "!mplayer -really-quiet -vo null  -endpos 5 -ss 90  '" . getline(".") . "' &>/dev/null & "<CR>:redraw!<CR> 
"map  <silent> <F5> :silent execute "!mplayer -really-quiet -vo null -endpos 5 -ss 40 " . shellescape(getline(".")) . " &>/dev/null & "<CR>:redraw!<CR>
"map  <silent> <F6> :silent execute "!mplayer -really-quiet -vo null -endpos 5 -ss 90 " . shellescape(getline(".")) . " &>/dev/null & "<CR>:redraw!<CR>


" Number of spaces in a tab, number of spaces in an "ident" from auto-indenters.
set tabstop=4
set shiftwidth=4

" Use spaces instead of tabs.
set expandtab

" Disable the silly two-spaces-after-a-period default of the text reflow methods.
set nojoinspaces

" Insert previous line's indentation when pressing [return].
set autoindent

" Assume a width of 120 instead of 80.
set tw=120


" Try to open the file associated with the Disciplinarian task UID (like 'DT...') underneath the cursor.
function! Disciplinarian_Load_File()
    let auid = expand("<cword>")
    let cmd  = "disciplinarian_get_uid_mapping.sh " . auid . " ./ "
    let fpath = system(cmd)
    "if filereadable(fpath) " Having problems with this. Won't work. No idea why. :/
    if !empty(fpath)
        "echo fpath 
        "silent execute "edit " . fpath 
        "silent execute "split " . fpath 
        silent execute "vsplit " . fpath 
    endif
endfunction

" Tell vim to let the terminal interpret mouse clicks -- don't use vim yanking with mouse.
set mouse=r

" Ignore mouse altogether. The behaviour keeps changing and is annoying / adds nothing.
set mouse=

" Re-enable per-file modelines on Debian (disabled system-wide be default).
" The 'modelines' parameter controls the number of lines to search at top and bottom of each file.
set modeline
set modelines=5
