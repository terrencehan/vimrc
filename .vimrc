"修改leader键为逗号
let mapleader=","

"Vundle Settings
filetype off              "必须的设置：

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'ryanss/vim-hackernews'
Bundle 'junegunn/vim-journal'
Bundle 'junegunn/goyo.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'mhinz/vim-startify'

Bundle 'tpope/vim-fireplace'

"Bundle 'dag/vim2hs'
Bundle 'scrooloose/syntastic'

"Bundle 'ianva/vim-youdao-translater'
"
Bundle 'jceb/vim-orgmode'
Bundle 'tpope/vim-speeddating'

Bundle 'plasticboy/vim-markdown'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'terrencehan/rust-vim'
Bundle 'ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'AutoClose'
Bundle 'ZenCoding.vim'
Bundle 'matchit.zip'
Bundle 'Tabular'
Bundle 'vim-scripts/DrawIt'
Bundle 'Lokaltog/vim-powerline'
Bundle 'gregsexton/gitv'
map <leader>tb :Tabularize /=
Bundle 'Valloric/YouCompleteMe'
"Bundle 'spiiph/vim-space'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'trailing-whitespace'
Bundle 'perl-support.vim'
Bundle 'taglist.vim'
Bundle 'jimenezrick/vimerl'
Bundle 'vimwiki/vimwiki'
Bundle 'tpope/vim-fugitive'
Bundle 'rdnetto/YCM-Generator'

Bundle 'rkitover/perl-vim-mxd'

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

"Bundle '_jsbeautify'
"nnoremap <leader>_ff :call g:Jsbeautify()<CR>

Bundle 'EasyMotion'
let g:EasyMotion_leader_key = '<Leader><Leader>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

"Fencview的初始设置
"Bundle 'FencView.vim'
"let g:fencview_autodetect=1

Bundle 'The-NERD-tree'
Bundle 'jistr/vim-nerdtree-tabs'
nmap <leader>nt :NERDTreeTabsToggle<cr>
"nmap <leader>nt :NERDTreeTabsToggle<cr>:set rnu<cr>
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
set nonumber                                        "显示行号
set history=1000                                    "记录历史的行数
set cursorline                                      "突出显示当前行
"set cursorcolumn                                   "列高亮
"set autoindent
set cindent
" set foldmethod
"set fdm=indent                                      "代码折叠
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set colorcolumn=85                                  "彩色显示第85行
"set isk+=-                                          "将-连接符也设置为单词

"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s   "设置C/C++语言的具体缩进方式
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

map <leader>tl :Tlist<cr>


"-----------------------------------------
"tlist设置
"TlistUpdate可以更新tags
"-----------------------------------------
"map <F3> :silent! Tlist<CR>        "按下F3就可以呼出了
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'         "因为我们放在环境变量里，所以可以直接执行
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
set tags=tags;
"autocmd FileType erlang set tags+=/Users/terrence/work/ptmind/git-svn/02_Service/PtNature/ptnature_ecology/apps/ptnature_ecology/tags
autocmd FileType c,cpp set tags+=/usr/include/tags
"autocmd FileType c,cpp set tags+=/Users/terrence/github/terrencehan/otp/tags
"autocmd FileType c,cpp set tags+=/Users/terrence/vagrant/sync/otp/tags
"autocmd FileType c,cpp set tags+=/Users/terrence/Downloads/nxlog-ce-2.8.1248/tags
"autocmd FileType c,cpp set tags+=/Users/terrence/github/balabit/syslog-ng/tags
"
autocmd FileType java map <leader>jd :JavaSearchContext<CR>

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
"autocmd FileType python set list

set listchars=tab:\|\ "注意 这里是一个|和一个空格，都转义字符

"-----------------------------------------
"perl
"-----------------------------------------
"map ,pt :%! perltidier
"map ,pt :%! /Users/terrence/perl5/perlbrew/perls/perl-5.20.0/bin/perltidy
"map ,pt :%! perltidy
map ,pt :%! /Users/terrence/perl5/bin/perltidier

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

"-----------------------------------------
"vim 标签移动快捷键
"-----------------------------------------
nmap 11 1gt
nmap 22 2gt
nmap 33 3gt
nmap 44 4gt
nmap 55 5gt
nmap 66 6gt
nmap 77 7gt
nmap 88 8gt

"-----------------------------------------
"Powerline
"-----------------------------------------
set laststatus=2
let g:Powerline_symbols='unicode'
let g:Powerline_stl_path_style = 'short'


"-----------------------------------------
""YouCompleteMe
"-----------------------------------------

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1  " /usr/local/bin/ctags --fields=+l -R ./*

"当离开insert mode的时候如果prv buffer开着就关掉
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1


"-----------------------------------------
" jedi python补全
"-----------------------------------------
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 1
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0


"-----------------------------------------
" startify
"-----------------------------------------
let g:startify_list_order = [
        \ ['   My most recently', '   used files'],
        \ 'files',
        \ ['   My most recently used files in the current directory:'],
        \ 'dir',
        \ ['   These are my sessions:'],
        \ 'sessions',
        \ ['   These are my bookmarks:'],
        \ 'bookmarks',
        \ ]


"gitv显示全部commit
let g:Gitv_CommitStep = 9999999999999


let g:EclimCompletionMethod = 'omnifunc'

"-----------------------------------------
"在tab中显示数字编号
"-----------------------------------------
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
