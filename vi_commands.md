* :q
* :q!
* :w
* :wq
* ESC²
* i
* .: run the last command (includes what you have inserted)

> Try to use more __.__.


#### Undo & Redo:

* u: undo
* ctrl+r: redo


cmdNbr : repeat cmb Nbr time

* 0 : to the beginning of the current line
* ^ : to the first non-whitespace character of the current line
* $ : to the end of the current line
* w : to the beginning of the next word or punctuation character
* W : to the beginning of the next word, ignoring punctuation characters
* b : to the beginning of the previous word or punctuation character
* B : to the beginning of the previous word, ignoring punctuation characters
* G : to the last line of the file

* nbrG : to line number

* a : append text after cursor
* i: append text at the cursor
* A : append text at the end of the current line
* I: append text at the beginning of the current line 

* o : insert a line below the current line and start writing
* O : insert a line above the current line and start writing

* cw: change from the current cursor to the end of the word
* cc: Change the current line
* r: replace the letter at the cursor
* R: replace from cursor on


#### MOVE:

> Hard to do.

* h: left  one char
* j: down  one line
* k: up    one line
* l: right one char

> You can append __g__ before any movement key to be able to move in global lines and not logical ones.

> Easy to do

* ^F: move Forward one screen
* ^B: move Backward one screen





#### DELETE (and copy):

* dd: delete current line
* dw: delete from the cursor to the end of the current word

* diw: delete inner word.
* daw: delete inner word and around space.

* dis: delete inner sentence.
* das: delete around sentence.

* dip: delete inner paragraph.
* dap: delete around paragraph.

* d$ or D: delete from the cursor to the end of the line.
* d0
* d^
* dG

* x X: Delete the character at, before the cursor.

* J: Joins lines, deletes the line break at the end of the line.

> You can use `c` instead of `d`, which will delete and put you in insert mode.

> Instead of `D` you can also use `C`.

> _i_ is for inner and _a_ is for around, which mean inner word and around spaces.



#### PASTE:
* P 

#### COPY:

* yd
* yW
* y$
* y0
* y^
* yG

#### SEARCH:
* /
* n

* /\c: Case insensitive
* /\d: look for a number


* :n
* :N

There is a full descriptive file written by Dmimda in the Linux\_Command directory about vi.


#### VISUAL Mode:

* v : character visual
* V : line visual
* ctr+v : bloc visual

* ~ : Switch case 
* d : delete
* c : change
* y : yank
* > : shift right
* < : shift left
* = : filter through equalprg option command
* gq : format lines to textwidth length


#### Splits:

* Rotate between splits: `^W W`
* Move between splits: `^W h-j-k-l` 
* Max out the height of current split: `^W _`
* Max out the width of current split: `^W |`
* Resize all splits to normal size: `^W =`
* Swap between splits: `^W R`
* Break out the current window into a new tab: `^W T`
* Close all splits but the current one: `^W o`
* Open a new file in a split: `:new <filepath>`, `:vnew <filepath>`

For easier split navigations:
```
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
```

And for more normal spliting:
```
set splitbelow
set splitright
```


#### Tabs:

* Move to next tab: `gt`.
* Move to previous tab: `gT`
* Open a new file in a new tab: `:tabe filename`



#### Searching & Substiuting:

* `:s/old/new`: Search and replace the first occurrence of old by new
* `:s/old/new/g`: Do the same for all occurrences in a line
* `:n,ms/old/new/g`: Same but between line numbers n and m
* `:%s/old/new/g`: All occurrences
* `:%s/old/new/gc`: All occurrences but prompt for each occurrence.


#### Macros:

* `q<char>`: record a macro
* `q`: to finish the macro
* `@<char>`: call the macro
* `<nbr>@<char>`: repeat macro nbr times

> Repeat last macro: `@@`

#### Registers:

* `:reg [chars]`: either display all registers or the space separated chars.
* `"<char>y`: Copy the selected text to the char register.
* `"<char>p`: Paste the text from the char register.
* `C-r <register name>`: paste the text from the register in __INSERT/COMMAND__ modes.


> In fact pasting with __p__ is using the default register `"`
> It's the same as `""p`.


* `"0 - "9`: numbered registers.

> 0 will be the latest yank
> 9 will be the oldest yank


> Macros and registers are practically the same.
> The former is for keystrokes and the later is only for text.

##### Read Only registers:

* `".`: The last inserted text.
* `"%`: Current file path.
* `":`: The most recently executed command.
* `"#`: The name of the alternate file.


##### Expression & Search Registers:

* `"=`: deal with results of expressions.




#### Marks:

* To set a marker: `m[a-zA-Z]`
* To go to a marker: `'[a-zA-Z]`

> You can use _capital_ letters to jump between files, as they persist between files and across vim sessions.


* `'[` and `']` boundries of the chunk of text you changed or yanked.
* `'<` and `'>` boundries of the last visual selection.

> `:help marks`


VISUAL BLOCK: ^V and you can replace with c, which after you type in the text and hit enter it will replace the whole visual block.



Spaces need to be escaped.


f<char>: -> Seek the next char   

da[/(: -> delete around bruckets or parentheses.



```
inoremap <Space><Space> <Esc></<++><Enter>"_c4l
autocmd FileType html inoremap ;i <em></em><Space><++><Esc>Fet>i
```




#### Numbers:

* To set numbers: `:set number`
* To unset them: `:set nonumber`
* To toggle: `:set number!`


#### Relative Number:

* To set relative numbers: `:set relativenumber`
* To unset them: `:set norelativenumber`
* To toggle: `:set relativenumber!`


#### Hybrid Number:

* To set hybrid numbers: `:set number relativenumber`
* To unset them: `:set nonumber norelativenumber`
* To toggle: `:set number! relativenumber!`



You can manipulate this bu activating and deactivating relative number for certain envents.  
Add this in the `.vimrc`.
```
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
```

> Make sure to activate ruler: `:set ruler`.



