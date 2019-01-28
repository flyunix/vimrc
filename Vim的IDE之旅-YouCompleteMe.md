Vim作为Unix类系统文本编辑器之王，一直受到广大程序员的青睐，但是，初次接触Vim的人，可能被其不太友好的操作方式所吓倒，其实，万事开头难，只要你开始接触Vim之后，慢慢使用Vim之后，渐渐地你就会喜欢上她迷人的使用体验，那种肆意妄为的快感是其它所有IDE所没有的。

Vim的IDE之旅，是一系列文章，主要是记录如何将Vim打造成一个现代的IDE的方法，本篇文章主要介绍Vim如何集成补全插件:YouCompleteMe的步骤。

## 系统环境
Linux环境为Ubuntu 18.04 desktop，该系统本身装完之后基本不提供开发工具，最为基本的ifconfig、gcc/g++都没有。这样也好，正好可以体验一下，如何从头一步一步的安装YouCompleteMe。

Vim的版本必须大于7.4.1578 ，并且支持Python2或者Python3，可以通过vim --version，查看vim的版本，以及是否支持Python2/3。如果你的Vim版本比较老的话，可以通过[源码升级](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)的方式，更新你的Vim。

YouCompleteMe推荐使用[Vundle](https://github.com/VundleVim/Vundle.vim#about)安装，所以，你的Vim需要首先安装Vundle。

*Note*
YCM是一个带有编译组件的插件。如果你使用Vundle更新YCM，那么，当ycm_core库API发生变化时，YCM会提醒重新编译它。

## 工具安装

### VIm安装
1. 安装
   ```sudo apt-get install vim```
2. 查看版本

	```vim --version```

	```VIM - Vi IMproved 8.0 ... +python3```

可以知道，Vim版本为8.0.1453，并且支持python3。

### Python3安装
1. Ubuntu 14.04:

    ```sudo apt install build-essential cmake3 python3-dev git```

2. Ubuntu 16.04 and later:

    ```sudo apt install build-essential cmake python3-dev git```

### Vundle安装
1. 下载

	```
	mkdir -p  ~/.vim/bundle/vundle
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
    ```

2. 安装

	将下面的配置信息添加到~/.vimrc(没有自行创建)中。

    	   set nocompatible  " be iMproved, required
    	   filetype off  " required
    	
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
    	   Plugin 'tpope/vim-fugitive'
    	   " plugin from http://vim-scripts.org/vim/scripts.html
    	   " Plugin 'L9'
    	   " Git plugin not hosted on GitHub
    	   Plugin 'git://git.wincent.com/command-t.git'
    	   " git repos on your local machine (i.e. when working on your own plugin)
    	   Plugin 'file:///home/gmarik/path/to/plugin'
    	   " The sparkup vim script is in a subdirectory of this repo called vim.
    	   " Pass the path to set the runtimepath properly.
    	   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    	   " Install L9 and avoid a Naming conflict if you've already installed a
    	   " different version somewhere else.
    	   " Plugin 'ascenator/L9', {'name': 'newL9'}
    	
    	   " All of your Plugins must be added before the following line
    	   call vundle#end()" required
    	   filetype plugin indent on" required
    	   " To ignore plugin indent changes, instead use:
    	   "filetype plugin on
    	   "
    	   " Brief help
    	   " :PluginList   - lists configured plugins
    	   " :PluginInstall- installs plugins; append `!` to update or just :PluginUpdate
    	   " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    	   " :PluginClean  - confirms removal of unused plugins; append `!` to auto-approve removal
    	   "
    	   " see :h vundle for more details or wiki for FAQ
    	   " Put your non-Plugin stuff after this line

	打开Vim，执行:PluginInstall，自动安装YouCompeteMe插件。

## YouCompeleteMe安装

进入到~/.vim/bundle/YouCompleteMe目录下，执行如下命令：
使YCM支持C/C++语法

`./install.py --clang-completer` 	

由于，会下载安装clang+llvm安装包，可能等待的时间的比较长。

    ## YouCompeleteME配置
    
	set runtimepath+=~/.vim/bundle/YouCompleteMe
	" 寻找全局配置文件
	let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

    YouCompleteMe安装成功之后，在.vimrc中增加如下的配置项:
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


其中，.ycm_extra_conf.py里面记录了c/c++类项目文件的补全规则，~/.vim/bundle/YouCompleteMe/cpp/ycm/目录是自己添加的，.ycm_extra_config.py文件可以在~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples里找到。

一般情况下，~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py作为全局的配置文件，而在具体的项目的根目录下，可以定制属于特定于该项目的配置文件，并把项目中头文件所在的目录加入到项目本地的.ycm_extra_conf.py中。例如，项目的头文件目录为：~/develop/emlib/include，那么需要在.ycm_extra_conf.py中的flag数组中添加如下代码。

	flags = [
	...

    '-isystem',
	'~/develop/emlib/include',
    ...
	]

YCM启动时，首先扫描当前目录，检测是否存在.ycm_extra_conf.py文件，如果没有找到，其会按照.vimrc中的配置加载全局的配置文件。
