"修改leader键为逗号
let mapleader=","

"Vundle Settings
filetype off              "必须的设置：

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'ctrlp.vim'
Bundle 'AutoClose'
Bundle 'ZenCoding.vim'
Bundle 'matchit.zip'
Bundle 'Tabular'
map <leader>tb :Tabularize /=
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'spiiph/vim-space'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'trailing-whitespace'
Bundle 'perl-support.vim'
Bundle 'taglist.vim'
Bundle 'Vimerl'
Bundle 'vimwiki'

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

Bundle '_jsbeautify'
nnoremap <leader>_ff :call g:Jsbeautify()<CR>

Bundle 'EasyMotion'
let g:EasyMotion_leader_key = '<Leader><Leader>'

"Fencview的初始设置
"Bundle 'FencView.vim'
"let g:fencview_autodetect=1

Bundle 'The-NERD-tree'
"nmap <leader>nt :NERDTree<cr>:set rnu<cr>
"let NERDTreeShowBookmarks=1
"let NERDTreeShowFiles=1
"let NERDTreeShowHidden=1
"let NERDTreeIgnore=['\.$','\~$']
"let NERDTreeShowLineNumbers=1
"let NERDTreeWinPos=1

Bundle 'The-NERD-Commenter'

"Bundle 'UltiSnips'
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

"放置在Bundle的设置后，防止意外BUG
filetype plugin indent on
syntax on

"-----------------------------------------------------------
"一般性设置
"-----------------------------------------------------------
set nocompatible
if has("autocmd")
    filetype plugin indent on "根据文件进行缩进
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
endif

set vb t_vb=
"set nowrap                                         "不自动换行
set hlsearch                                        "高亮显示结果
set incsearch                                       "在输入要搜索的文字时，vim会实时匹配
set backspace=indent,eol,start whichwrap+=<,>,[,]   "允许退格键的使用
syntax enable
set background=dark
set number                                          "显示行号
set history=1000                                    "记录历史的行数
set cursorline                                      "突出显示当前行
"set cursorcolumn                                   "列高亮
"set autoindent
set cindent
" set foldmethod
set fdm=indent                                      "代码折叠
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set colorcolumn=85                                  "彩色显示第85行
set isk+=-                                          "将-连接符也设置为单词

set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s   "设置C/C++语言的具体缩进方式
set shiftwidth=4                                        "自动缩进的宽度
set smartindent                                         "开启新行时使用智能自动缩进
set expandtab                                           "使用空格代替tab.
set tabstop=4                                           "让一个tab等于4个空格
set softtabstop=4                                       "使得按退格键时可以一次删掉 4 个空格
set showmatch                                           "插入括号时，短暂地跳转到匹配的对应括号
set nobackup                                            "覆盖文件时不备份
set guifont=Monaco\ bold\ 10
set guioptions-=m
set guioptions-=T
colorscheme jellybeans                                  "设定配色方
set autochdir                                           "自动切换当前目录为当前文件所在的目录

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>


"-----------------------------------------
"首先确认安装了ctags和cscope，并且确认这两个可执行程序所在的目录已经放进环境变量里面。（必须做，否则后边都无法操作）
"在vimrc中配置如下：
"-----------------------------------------
"map <F12> :call Do_CsTag()<CR>
"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
"nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
"nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"function Do_CsTag()
    "let dir = getcwd()
    "if filereadable("tags")
        "if(g:iswindows==1)
            "let tagsdeleted=delete(dir."\\"."tags")
        "else
            "let tagsdeleted=delete("./"."tags")
        "endif
        "if(tagsdeleted!=0)
            "echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            "return
        "endif
    "endif
    "if has("cscope")
        "silent! execute "cs kill -1"
    "endif
    "if filereadable("cscope.files")
        "if(g:iswindows==1)
            "let csfilesdeleted=delete(dir."\\"."cscope.files")
        "else
            "let csfilesdeleted=delete("./"."cscope.files")
        "endif
        "if(csfilesdeleted!=0)
            "echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            "return
        "endif
    "endif
    "if filereadable("cscope.out")
        "if(g:iswindows==1)
            "let csoutdeleted=delete(dir."\\"."cscope.out")
        "else
            "let csoutdeleted=delete("./"."cscope.out")
        "endif
        "if(csoutdeleted!=0)
            "echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            "return
        "endif
    "endif
    "if(executable('ctags'))
        ""silent! execute "!ctags -R --c-types=+p --fields=+S *"
        "silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    "endif
    "if(executable('cscope') && has("cscope") )
        "if(g:iswindows!=1)
            "silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        "else
            "silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        "endif
        "silent! execute "!cscope -b"
        "execute "normal :"
        "if filereadable("cscope.out")
            "execute "cs add cscope.out"
        "endif
    "endif
"endfunction


"-----------------------------------------
"tlist设置
"TlistUpdate可以更新tags
"-----------------------------------------
"map <F3> :silent! Tlist<CR>        "按下F3就可以呼出了
let Tlist_Ctags_Cmd='ctags'         "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0        "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0           "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1    "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1         "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1     "不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

"-----------------------------------------
"对NERD_commenter的设置
"-----------------------------------------
let NERDShutUp=1
"支持单行和多行的选择，//格式
map <c-h> ,c<space>

"-----------------------------------------
"omniCppComplete
"----------------------------------------
"set completeopt=menu "这个是在www.vimer.cn看到的，如果不想看到详细的信息的话uncomment


"-----------------------------------------
"tags
"----------------------------------------
set tags=tags
set tags+=./tags
autocmd FileType c,cpp set tags+=/usr/include/tags

"-----------------------------------------
"indent
"----------------------------------------
map <F5>  :!indent -di18 -br -ce -bad -bap -bc -npcs -cdw -brs -i8 -il0 -cli4 %;rm *~<CR>
"-dil16 declaration-indentationn 变量声明部分格式
"-br if语句所在行包含'{'
"-bad blank-lines-after-declarations
"-bap blank-lines-after-procedures
"-bc   a newline is forced after each comma in a declaration
"-npcs   no space after function call names
"-cdw    cuddle-do-while
"-brs    put braces on struct declaration line
"-i4

"-----------------------------------------
"maps
"----------------------------------------
inoremap  ,  ,<Space>
inoremap jj <ESC>
inoremap ff <ESC>A
"inoremap  ;  ;<CR>
"inoremap ( ()<Left>
"autocmd FileType erlang inoremap ! <Space>!<Space>
"autocmd FileType erlang inoremap + <Space>+<Space>
"autocmd FileType erlang inoremap ++ ++
"autocmd FileType erlang inoremap - <Space>-<Space>
"autocmd FileType erlang inoremap -- --
"autocmd FileType erlang inoremap  ->  <Space>-><Space><CR>
"autocmd FileType erlang inoremap  _>  <Space>-><Space>
"autocmd FileType erlang inoremap %% <Space>%<Space>
"autocmd FileType erlang inoremap ** <Space>*<Space>
"autocmd FileType erlang inoremap == <Space>==<Space>
"autocmd FileType erlang inoremap != <Space>!=<Space>
"autocmd FileType erlang inoremap >= <Space>>=<Space>
"autocmd FileType erlang inoremap <= <Space><=<Space>
"autocmd FileType erlang inoremap =:= <Space>=:=<Space>
"autocmd FileType erlang inoremap = <Space>=<Space>


"-----------------------------------------
"window management
"-----------------------------------------
let g:winManagerWindowLayout='FileExplorer|TagList|BufExplorer'
let g:winManagerWidth=35
map <F3> :WMToggle<CR>   "按下F3就可以呼出了
"-----------------------------------------
"indent line
"-----------------------------------------
"autocmd FileType erlang set list

set listchars=tab:\|\ "注意 这里是一个|和一个空格，都转义字符

"-----------------------------------------
"perl
"-----------------------------------------
"map ,pt :%! perltidier
map ,pt :%! perltidy

"-----------------------------------------
"temp
"-----------------------------------------
map ,pp :s/p>/p_zh>/g
map ,he :s/and/和/g
map ,ii :s/item>/item_zh>/g
"-----------------------------------------
"vimwiki
"-----------------------------------------
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'erlang': 'erlang', 'perl': 'perl6'}
let wiki.template_path = '~/vimwiki/templates/'
let wiki.template_default= 'default'
let wiki.template_ext= '.html'
let g:vimwiki_list = [wiki]
nmap <leader>tt <Plug>VimwikiToggleListItem

