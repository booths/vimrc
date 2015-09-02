Ruby vimrc
==========

A quick vimrc for Ruby on Rails programming

## 理念

1. Simple
2. Only for Ruby on Rails
3. Powerful

## 安装方法 ( 2015.1.30 更新 )

前提: 不像其它的插件需要特定版本的 `vim`, 一般内置的 `vim` ( >= 7.3 ) 即可, 或者 mac 下使用 `brew install vim`

继续输入以下指令:

```bash
# 安装 Vundle( vim 插件管理器 )
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ git clone https://github.com/windy/ruby-vimrc.git

$ cp ruby-vimrc/vimrc ~/.vimrc

$ vim
  # 输入以下指令
  :PluginInstall( in vim input this command)
  # 等待插件安装完成, 重启 vim, OK
  :q!
```

## 如何使用

1. 使用 `vim-rails` 来高效开发 Rails
2. 使用 `NERDTree` 来管理文件树
3. 几款简洁的高亮与注释插件
4. 使用 `ctrlp` 来搜索文件
5. 阅读 `vimrc` 来快速了解

## 文档更新

用法指南文档: <http://ruby-china.org/topics/19315>
很久之前, 写完一篇 Rails.vim 指南, 结果至今还有人去关注它. 但它的内容已经过旧, 我打算今天写一篇 Rails 高效开发工具 vim 的指南, 不仅仅是新版的 Rails.vim 插件常用指令, 还包括一些高效的 vim 使用指南.

再次说明, 本文只适用于将 vim 用于 Rails 开发的待进阶高手.

我们将从最常用的 跳转指令 开始.

开始之前, 推荐实战操作, 建议安装我专为 Rails 开发准备的 vimrc 配置, 相信你已经准备好了.

跳转

跳转是我们在任何 IDE 中都是最常用的一个功能, 我使用以下插件来完成跳转:

Rails.vim
ctrlp.vim
NEDTtree
vim-easymotion
我们来根据实际需求来讲解, 首先是标准目录的情况.

标准 Rails 目录

Rails 的标准目录是我们最爱了, 最常使用的就是使用 Rails.vim 的跳转.

安装好相关插件后, 我们进入一个 Rails 目录, 比如 wblog, 打开 vim, Rails.vim 就自动启动了.

输入:

Rcontroller blogs : 跳转至控制器 app/controllers/blogs_controller.rb

Rmodel post: 跳转至模型 app/models/post.rb

同理, Rjavascript, Rstylesheet, Runittest, Rspec, Rfunctiontest 不消多说.

更酷的是相关性跳转, 它会根据你的 controller 名来确定用哪个 views, 例如你在 app/controllers/blogs_controller.rb, 输入

    +-------------+----+---------------------------------+
    | Rview index | -> | app/views/blogs/index.html.slim |
    +-------------+----+---------------------------------+
    | Rhelp       | -> | app/helpers/blogs_helper.rb     |
    +-------------+----+---------------------------------+
这种相关性跳转超酷, 几乎所有的跳转都支持它, 而且随时可以尝试使用 TAB 补全.

别急, 还有更酷的是 gf 指令, 假如你在 app/controllers/blogs_controller.rb 文件中, 光标在 def index 方法上, 按下 gf 指令, Oh My God, 自动跳转至 app/views/blogs/index.html.slim 了, 别急, ctrl + 6 切回去吧.

这个 gf 与 ctrl + 6 是我非常常用的指令, 非常酷.

继续来看 gf, * 是光标位置, 右边是按下 gf 后的跳转.

    +-----------------------------------------------+----+-------------------------------------------+
    |                                   Pos*t.first | -> | app/models/post.rb                        |
    +-----------------------------------------------+----+-------------------------------------------+
    | has_many :c*omments                           | -> | app/models/comment.rb                     |
    +-----------------------------------------------+----+-------------------------------------------+
    | link_to 'Home', :controller => 'bl*og'        | -> | app/controllers/blog_controller.rb        |
    +-----------------------------------------------+----+-------------------------------------------+
    | <%= render 'sh*ared/sidebar' %>               | -> | app/views/shared/_sidebar.html.erb        |
    +-----------------------------------------------+----+-------------------------------------------+
    | <%= stylesheet_link_tag 'scaf*fold' %>        | -> | public/stylesheets/scaffold.css           |
    +-----------------------------------------------+----+-------------------------------------------+
    | class BlogController < Applica*tionController | -> | app/controllers/application_controller.rb |
    +-----------------------------------------------+----+-------------------------------------------+
    | fixtures :pos*ts                              | -> | test/fixtures/posts.yml                   |
    +-----------------------------------------------+----+-------------------------------------------+
    | layout :pri*nt                                | -> | app/views/layouts/print.html.erb          |
    +-----------------------------------------------+----+-------------------------------------------+
    | <%= link_to "New", new_comme*nt_path %>       | -> | app/controllers/comments_controller.rb    |
    +-----------------------------------------------+----+-------------------------------------------+
显然, 有了 Rails.vim, 我们将比 netbeans, eclipse, rubymine 它们快一个数量级的跳转速度.( 它们得用鼠标 )

虽然已经简化到极致了, 但 Rails.vim 还有更让我们舒服的 A, R 单指令, A 总是跳至测试文件, R 则相反, 看下效果:

    +--------------------------+--------------------+-----------------------------+
    | * Current file           | Alternate file     | Related file                |
    +--------------------------+--------------------+-----------------------------+
    | * model                  | unit test          | schema definition           |
    +--------------------------+--------------------+-----------------------------+
    | * controller (in method) | functional test    | view                        |
    +--------------------------+--------------------+-----------------------------+
    | * template (view)        | functional test    | controller (jump to method) |
    +--------------------------+--------------------+-----------------------------+
    | * migration              | previous migration | next migration              |
    +--------------------------+--------------------+-----------------------------+
OK, 标准化的目录跳转就这些.

那么遇到非标准的目录我们该怎么办?

也简单, 来看看我为大家准备的新插件
非标准目录

非标准目录 Rails.vim 提供的帮助并不大, 但有了 ctrlp, 我们能继续赶超其他编辑器.

我使用了 ctrlp 插件默认的配置, 并增加了 ctrl+o 为打开最近打开文件列表的缓冲区. 我们来看看实际例子.

例如我安装了 angularjs 作为我的前端框架, 生成了目录 app/assets/javascripts/angularjs/ 来作为它的控制器, 我们想跳转过来, 怎么办?

试着在 vim 的命令模式输入 ctrl+p, OK, 打开了一个提示框, 再输入 angularjs/admin_posts, 按下回车, 即可. 这其实就是类似于 sublime text, textmate 们的 ctrlp 快捷键嘛, 嗯, 对的.

可以模糊搜索, 记得使用 F5 来刷新新文件. 通过这个加上 ctrl+6, 可以轻易的来回切换.

但是, 我们有时候需要来回在最近几个文件中切换, 就算使用了 Rails.vim 也稍稍不爽, 楼主有何高见. 当然有, 看第三点.
最近文件历史切换

在计算机术语有一个 LRU 的名词, 大家还记得吗? 对的, 最近缓冲区列表, 我们 vim 党也有, 很简单, 别慌:

配置好我的 vimrc 后, 先随便用 Rails.vim 的 R 指令打开几个文件. 然后在命令模式下输入 ctrl+o, 发现了什么?

嗯, 我们最近打开的文件列表, 输入关键字搜索, ctrl+j 向下, ctrl+k 向下. 回车选中.

就这样, 超级简单, 对吧? 比其他的编辑器好很多吧:)

除此之外, 有人想要一个文件列表, 好办, 输入命令 :NEDTree( 或者使用 F8 ), 马上出现了一个左树, 使用 ctrl+w+w 切换过去吧.

说到这里, 我想补充一个好东西, 以更沉重打击对手, 不让对手喘息, 那就是 vim-easymotion, 它是用来文件内快速短途跳转工具. 我们不用鼠标, 自然要发挥好键盘.

在一个文件内, 光标置至一个方法上, 输入 ,,w( 对, 两个逗号 ), 然后我们发现有些字母变色了, 我们再次输入变色字母就非常准确的跳转光标过去了.

同理, 输入 ,,b 是向前跳( 很好记, w 是 vim 自带的向后跳一个单词, 而 b 是相前, 而逗号, 什么, 你在问为什么是逗号吗, 你可以离开此文啦 ^-^ )
说了这么说, 跳转指令差不多完工了, 不过需要提一点的是 Rails.vim 实际上在新版本使用了 Exx 指令, 而不是 Rxx, 不过, 我还是喜欢 Rxx, 你可以自行将上面的 Rxx 脑补为 Exx.

创建与编辑文件

除了跳转, 我们有时候需要直接编辑或创建文件, 我们绝不会像某些伪 Geek 一样打开一个新的终端操作, 对吧?

编辑

很好, 直接使用 R config/database.yml, 嗯嗯, 打开了. 也就是说 R 指令后面带上参数的话, 就是相对 Rails.root 打开文件的.

简单.

那么, 新建呢?
新建

再输入 R config/database.yml.example 吧, 发现已经新建了, 试着 r config/database.yml 一下, 直接打开另一个文件复制进来( 好难, 嗯, 老师告诉你这个不需要会)

别忘了离开时保存即可.

说到这里, 补充一点, 对于 Rview 这个指令, 如果你在后面的参数带上了 .html.erb 或 .html.slim , 它会尝试帮你创建对应的空文件，很方便. (很常用）

OK, 还有注释功能呢.
注释

注释功能我们使用了 The-NERD-Commenter, 在任何文件中, 先用虚拟行选中将被注释的行( 即 大写的 V ), 然后按下 ,cc, 然后看到没, 已经被注释了, 反之, 则使用 ,cu 来反注释. 当然, 你还可以使用 vim 自带的 u 来撤消, ctrl+r 来重来. 就这些, 很简单吧.
erb 编辑

除此之外, 如果我们还使用的老的 html.erb 的话, 我推荐使用 sparkup 来写 html 标签, 它与 zencoding (emmet) 非常像, 但更简单一些, 例如:

打开 a.html.erb, 然后输入 div.class1, 按下 ctrl+e, 马上就变为 <div class='class1'>*</div>, 常开发 web 的人都知道, 我就不献丑了.
不多不少, 刚刚好, 有人还喜欢用 supertab 之类的, 我是非常不推荐, 用好插入模式的 ctrl+p 与 ctrl+n 就足够文件补全了.

下面, 我想再补充几个非常常用的 vim 指令.

vim 很有用的指令

文件内移动

使用 ctrl+e, ctrl+y 来移动屏幕

使用 :10 直接跳转至第 10 行

使用 G, gg 分别跳至最后一行, 与第一行

使用 /xx 来搜索文件内容
从网页上复制回代码

先使用 set paste 设置为粘贴模式, 再粘贴就不会因为自动对齐代码而乱掉, 再使用 set nopaste 来取消粘贴模式.
从 vim 里复制出来代码

非常不好的消息是, vim 自带的 yy 无法直接 copy 出来, 不过也不是, 可以使用 :+y 来复制, 这样就可以直接复制出来了.

当然, 使用 :+p 来将系统剪切板粘进 vim 中.
文件编辑

插入模式除了 i 之外, 还有几个: S 是删除当前行开始插入, C 是删除光标之后的内容并插入, s 是删除当前字符并插入. ( 这几个都相当常用 )

经常在一个单词中间想删除当前整个单词, 不移动光标的情况下, 使用 diw 来删除整个单词, 其记忆方法是: 删除行内单词. 更多可见: surround.vim 这个插件的功能, 在处理 css, html tag 时非常有用.

随时使用 ctrl+p 与 ctrl+n 来自动补充.

选中某几行, 按下 = 来格式化代码

使用 > 来向右移动选中的几行, < 向左.
mark 跳转功能

使用 ma 来标记某一行, 然后可以放心查看其他行, 随时使用 "a 来跳回, 你可以使用 26 个寄存器 :)
附: vim 简洁哲学

不要过多映射单键
多使用 vim 默认的快捷键
尽量使用 buffer 而不是 tab
少用插件, 除非你知道需要什么
广而告之

以此为目标, 结合 Rails 开发所需要的高亮插件, 我重新整理了我的 ruby-vimrc 配置, 仅仅 for ruby 开发, 大家如果是纯 Ruby on Rails 开发工程师, 可以马上 fork 出去, 自己用之和改之.

没有精力来整理一个像 on-my-zsh 这样猛的东西, 但这个也很 Nice:)

记得, 简洁而不简单, vim 不仅仅是一个命令行编辑器, 它是我们的开发利器.

如果你发现此文对你有用，对我有更多兴趣，欢迎访问和订阅我的博客：
http://yafeilee.me/

## 更新记录

### 2015.1.30

1. 使用 emmet 来编写 HTML5 网页
2. 增加关键字补全对 - 的支持
3. 增加自动去除行尾空格特性

### 2014.12.21
1. 默认开启 256 色, 可以将 vim 配置的更色彩
2. 将 html 插件切换到 emment, 更加易用
3. 优化 css 的关键字支持

### 2014.10.17
1. 更新了 Vundle 至最新版
2. 新版 Vundle 导致 vim-slim 不正常, 修复之

### 2014.5
1. 去掉一些重量性的插件
2. 整理了注释
3. 精简了插件, 优化 `vim-rails` 的补全

谢谢以下插件的作者们提供这么好的插件
===========

* Vundle
* tpope/vim-rails (power tools for ruby on rails)
* tpope/vim-fugitive (powerful vim git tool)
* Lokaltog/vim-easymotion (quickly move your cursor)
* kien/ctrlp.vim (quickly search your code)
