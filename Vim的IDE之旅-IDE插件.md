# PluginList

1. Auto Pairs:插件会自动插入和格式化方括号和圆括号；
2. NERD Commenter:代码自动注释；
3. tComment:快速注释、反注释代码；
4. Snipmate:snipmate可以容易的插入代码片段到你的文件里面，大大的减少了你敲键盘的次数。它默认的包含了很多各种语言的代码片段，你也可以非常容易的添加你自己的;
5. NERDTree:管理一个大的项目时，把代码分散到不同的文件里面是非常好的主意。也是一个基本的编码原则。NERDTree 是一个不错的可以直接在Vim里使用的文件浏览器，它可以让你随时想到所有的文件。
6. MiniBufferExplorer:为了打造一个文件浏览器，支持同时打开多个文件，没有什么比一个好的缓冲区管理器更重要了。MiniBufferExplorer 就可以非常漂亮和高效地完成这个工作。它甚至为你的缓冲区设置了不同的颜色和切换快捷键;
7. Tag List:当你同时有多个文件打开时，很容易忘了你都在这些文件里添加了什么。为了防止你忘记，Tag List 这个代码查看器将会用一种漂亮简洁的格式展示其中的的变量和函数;
8. undotree:对于我们之中那些喜欢undo，redo然后又undo某些更改，然后依据这些来查看整个编辑完成过程的人来说， undotree 是一个不错插件，可以以一棵树的形式看到你的undo和redo历史。这个功能跟代码完全没有关系，所以这是我非常喜欢的一个插件。
9. gdbmgr:每个人都在某个时刻需要一个调试器。如果你喜欢gdb，那么gbdmgr就是为你准备的，因为它集成了那个著名的调试器到Vim中。
10. cscope:
11. powerline+fugitive:当前模式、Git分支、文件路径、文件是否保存以及当前所载行和 列的信息。这是通过vim-powerline来实现的。其中显示Git信息需要配合vim-fugitive插件一些使用;（set statusline+=%{fugitive#statusline()} "  Git Hotness）

# InstallList

## NERDTree
1. 首先在Vundle的配置中增加NERDTree：

    Plugin 'The-NERD-tree'

2. 配置
	
    NERD tree

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

    autocmd VimEnter * NERDTree

    " 更多的命令，参见:help NERDTree

    " end of NERD tree config    

## TagList

1. 首先在Vundle的配置中增加taglist.vim：

    `Plugin 'taglist.vim'`
2. 配置:

	    "Tag List
	    autocmd VimEnter * TlistToggle
	    "只显示当前文件的tags
	    let Tlist_Show_One_File=1
	    "设置taglist宽度
	    let Tlist_WinWidth=40
	    "tagList窗口是最后一个窗口，则退出Vim
	    let Tlist_Exit_OnlyWindow=1 
	    "在Vim窗口右侧显示taglist窗口
	    let Tlist_Use_Right_Window=1 
	    "end of Tag List

## winmanager

1. 首先在Vundle的配置中增加winmanager:
	
	`Plugin 'winmanager'`

2. 配置:
	
	.vimrc配置
	
	    "winManager 
	    let g:NERDTree_title='NERD Tree'
		"TagList需关闭Tlist_Auto_Open
	    let g:winManagerWindowLayout='NERDTree|TagList'
	    ""设置winmanager的宽度，默认为25
	    let g:winManagerWidth = 30
	    function! NERDTree_Start()
	    exec 'NERDTree'
	    endfunction
	    
	    function! NERDTree_IsValid()
	    return 1
	    endfunction
	    
	    " 绑定F2到winmanager
	    let g:AutoOpenWinManager=1

	winmanager.vim增加AtuoOpenWinManger功能

		" 绑定F2到winmanager
		nmap <silent> <F2> :WMToggle<CR>
		let g:AutoOpenWinManager=1
		
		"set auto open Winmanager
		if g:AutoOpenWinManager
		autocmd VimEnter * nested call s:ToggleWindowsManager()|1wincmd w
		endif

## indexer
1. 安装，indexer依赖于DfrankUtil、Vimprj，Vundle中增加如下配置信息：
	
		Plugin 'DfrankUtil'                                             
		Plugin 'vimprj'                                                 
		Plugin 'indexer.tar.gz'

2. .vimrc中增加如下配置:
	
		" indexer                                                       
		" 设置indexer 调用 ctags 的参数                                 
		" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
		" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl                                       
		let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --e
		xtra=+q"

3. indexer会根据你的代码工程的不同，自动生成并在其中的代码文件被打开时自动加载tags文件。它是通过配置文件来指定工程设置的，此文件为~/.indexer_files。以下是一个配置示例，演示了2个不同的工程的Indexer配置。
	
		[CoolProject] 
		/home/user/cool_project 
		
		[AnotherProject] 
		option:ctags_params = "--languages=c++" 
		/home/user/another_project/src 
		/home/user/another_project/lib

## cscope.vim
1. 安装

	`Plugin cscope.vim`

2.  配置：将如下的配置信息替换cscope的快捷键配置信息:
	
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
3. 提供的命令：
		列出所有cscope数据库
		
		:CscopeList

4. 
		Cscove(new name for this plugin, since cscope.vim is used too widely.) is a
	    smart cscope helper for vim.
	    
	    It will try to find a proper cscope database for current file, then connect to
	    it. If there is no proper cscope database for current file, you are prompted to
	    specify a folder with a string like --
	    
	    Can not find proper cscope db, please input a path to create cscope db for.
	    
	    Then the plugin will create cscope database for you, connect to it, and find
	    what you want. The found result will be listed in a location list window. Next
	    time when you open the same file or other file that the cscope database can be
	    used for, the plugin will connect to the cscope database automatically. You
	    need not take care of anything about cscope database.
	    
	    When you have a file edited/added in those folders for which cscope databases
	    have been created, cscove will automatically update the corresponding database.
	    
	    Cscove frees you from creating/connecting/updating cscope database, let you
	    focus on code browsing.