---
layout: post
title: "Setup Octopress on Windows 7"
date: 2012-08-22 16:42
comments: true
categories: octopress
---
{% img left http://octopress.org/images/logo.png %}

 *Windows 7 + ruby 1.9.3p125 (2012-02-16)*
先安装 ruby 1.9.3和DevKit
然后git clone octopress
octopress目录下有个rakefile
rake -T查看可用的task
rake new_post["post title"]
在/source/_post下生成一个markdown文件，
编辑markedown文件为blog内容

rake generate将在_deploy目录下生成静态文件
rake deploy将生成的静态文件push到github上

其中在generate的时候可能由于python的版本问题出错：

当增加如下code block 后，
```ruby code block
	```language-name
```
使用octopress的rake generate生成静态文件时，提示无法打开:
```bash error
	Could not open library ...python26.dll
```
原因是python的版本不对。
下载了一个activepython2.7.2.5后，设置好环境变量就OK了
octopress的语法高亮是gem rubypython调用python的pygments做得

## 参考：
	
- [在github上用octopress搭建博客过程纪要](http://www.cnblogs.com/rubylouvre/archive/2012/06/10/2543744.html)
- [用Octopress搭建基于github的博客](http://ihacklog.com/post/how-to-setup-an-octopress-blog-on-github.html)
- [Octopress设置与增加微博的侧边栏](http://clark1231.iteye.com/blog/1553939)
