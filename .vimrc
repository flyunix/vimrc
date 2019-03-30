"VIM rule
set nocompatible              " be iMproved, required filetype off                  " required 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-utils/vim-man'
Plugin 'taglist.vim'
Plugin 'minibufexpl.vim'
Plugin 'The-NERD-tree'
Plugin 'powerline/powerline'
Plugin 'fugitive.vim'
Plugin 'Auto-Pairs'
Plugin 'tComment'
Plugin 'winmanager'
Plugin 'vim-scripts/khaki.vim'
Plugin 'DfrankUtil'                                             
Plugin 'vimprj'                                                 
Plugin 'indexer.tar.gz'
Plugin 'twilight'
Plugin 'cscope.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'morhetz/gruvbox'
Plugin 'srcexpl'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set nu
" Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side
set nocompatible 
" Enable syntax highlighting.
syntax on

"突出显示当前行
set cursorline

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=999

" Use UTF-8.
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Set color scheme that I like.
"colorscheme desert 
colorscheme gruvbox
set background=dark
set t_Co=256

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\
set statusline+=%f\
set statusline+=%h%m%r%w
set statusline+=\[%{strlen(&ft)?&ft:'none'}]
set statusline+=%=
set statusline+=0x%-8B
set statusline+=%-14(%l,%c%V%)
set statusline+=%<%P
set statusline+=%{fugitive#statusline()} "  Git Hotness

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Show line number, cursor position.
set ruler

" Display incomplete commands.
"set showcmd

" To insert timestamp, press F3.
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Search as you type.
set incsearch

" Ignore case when searching.
" set ignorecase

" Show autocomplete menus.
" set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell
set nocp

"文件类型侦测配置
"开启文件类型侦测
filetype on
"根据侦测到的不同类型,加载对应的插件.
filetype plugin on

"快捷键
"定义快捷键到行首和行未
nmap lb 0
nmap le $
"定义快捷键前缀
let mapleader=";"
"定义快捷键关闭当前分割窗口
nmap <leader>q q:<CR>
"定义快捷键保存当前窗口内容
nmap <leader>w :w<CR>
"不做任何保存，直接退出 vim
nmap <leader>Q :qa!<CR>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
"
"folding setting
set foldmethod=syntax
"启动vim时不要自动折叠代码
set foldlevel=100

nmap m2 :Man 2 <C-R>=expand("<cword>")<CR><CR>
nmap vm2 :Vman 2 <C-R>=expand("<cword>")<CR><CR>

nmap m :Man <C-R>=expand("<cword>")<CR><CR>
nmap vm :Vman <C-R>=expand("<cword>")<CR><CR>

"quickfix setting
" 按下F6，执行make clean
map <F6> :make clean<CR><CR><CR>
" " 按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息
map <F7> :make ARCH=atmel9260<CR><CR><CR> :copen<CR><CR>
" " 按下F8，光标移到上一个错误所在的行
map <F8> :cp<CR>
" " 按下F9，光标移到下一个错误所在的行
map <F9> :cn<CR>
" " 以上的映射是使上面的快捷键在插入模式下也能用
imap <F6> <ESC>:make clean<CR><CR><CR>
imap <F7> <ESC>:make<CR><CR><CR> :cw<CR><CR>
imap <F8> <ESC>:cp<CR>
imap <F9> <ESC>:cn<CR>

" configuration for supertab plugin
let g:SuperTabDefaultCompletionType = "context"

" configuration for minibufexpl plugin
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0 

"YCM configs
"set runtimepath+=~/.vim/bundle/YouCompleteMe
" 寻找全局配置文件
"let g:ycm_global_ycm_extra_conf='/home/qihua/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" 开启 YCM 标签补全引擎,使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tags_files=1

" 注释与字符串中的内容也用于补全
let g:ycm_collect_identifiers_from_comments_and_strings=1

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 补全功能在字符串中同样有效
let g:ycm_complete_in_strings=1

"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings=1

"禁用语法检查
let g:ycm_show_diagnostics_ui=0  

"允许 vim 加载 .ycm_extra_conf.py 文件，每次打开vim时不再提示
let g:ycm_confirm_extra_conf=0

"映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

"回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" 菜单颜色\布局
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项颜色\布局
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

"让补全行为与一般的IDE一致
set completeopt=longest,menu

"跳转到定义处
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     

"end of YCM configs

"
" NERD tree
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
"autocmd VimEnter * NERDTree
" 更多的命令，参见:help NERDTree
" end of NERD tree config
nmap <F9> :NERDTreeToggle<CR>

"
"Tag List
nmap <F7> :TlistToggle<CR>
"只显示当前文件的tags
let Tlist_Show_One_File=1    
"设置taglist宽度
"let Tlist_WinWidth=20        
"tagList窗口是最后一个窗口，则退出Vim
let Tlist_Exit_OnlyWindow=1 
"在Vim窗口右侧显示taglist窗口
let Tlist_Use_Right_Window=1 
"autocmd VimEnter * TlistToggle
let Tlist_Auto_Open=0
"set ctags
let Tlist_Ctags_Cmd="/usr/bin/ctags"
"end of Tag List


"winManager 
"
"let g:NERDTree_title='NERD Tree'
"let g:winManagerWindowLayout='NERDTree|TagList'
""设置winmanager的宽度，默认为25
"let g:winManagerWidth = 30
"function! NERDTree_Start()
"    exec 'NERDTree'
"endfunction

"function! NERDTree_IsValid()
"    return 1
"endfunction

" 绑定F2到winmanager
"nmap <silent> <F2> :WMToggle<CR>
"let g:AutoOpenWinManager=0

" indexer                                                       
" 设置indexer 调用 ctags 的参数                                 
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl                                       
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

"
" cscope setting
if has("cscope")
  set csprg=/usr/bin/cscope "cscope位置
  set csto=1                "cscope DB search first
  set cst                   "cscope DB tag DB search
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb                "verbose off"
endif

"nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"cscope.vim
"
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR> 
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR> 
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR> 
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR> 
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR> 
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR> 
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR> 

let g:cscope_silent=1

"
"markdown-preview.vim
"
" for normal mode
nmap <silent> <leader>mp :MarkdownPreview <CR>

" for normal mode
nmap <silent> <leader>ms :MarkdownPreviewStop<CR>

"Source Explorer环境设置
nmap <F8> :SrcExplToggle<CR>
nmap <C-H> <C-W>h                 "向左侧窗口移动"
nmap <C-J> <C-W>j                 "向右侧窗口移动"
nmap <C-K> <C-W>k                 "向上端窗口移动"
nmap <C-L> <C-W>l                 "向下端窗口移动"

let g:SrcExpl_winHeight = 8       "指定SrcExpl Windows高度"
let g:SrcExpl_refreshTime = 100   "refreshing time = 100ms"
let g:SrcExpl_jumpKey = "<ENTER>"  "跳转(jump)至相应定义definition"
let g:SrcExpl_gobackKey = "<SPACE>" "back"
let g:SrcExpl_isUpdateTags = 0     "tag file update = off"
