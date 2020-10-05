# Readme

本项目是基于[Homestead](https://laravel.com/docs/8.x/homestead)进行国内定制,支持apache, apigility, expressive, laravel (the default), proxy, silverstripe, statamic, symfony2, symfony4, zf, thiknphp.

## Requirement

- laravel/homestead (virtualbox, 10.1.0)
- Vagrant 2.2.10
- virtualbox 6.1.12
- composer

**mac用户可使用homebrew安装vagrant和virtualbox**

1. `brew cask install vagrant`
2. `brew install virtualbox`

## Setp

1. `git clone git@github.com:GloomyNAN/homestead-zh.git`
2. `cd homestead-zh & composer install`;
3. `cp Homestead.yaml.example Homestead.yaml`并配置；
4. `cp envs/init.sh.example envs/init.sh`
5. `vagrant up`;
   
## 目录结构

```
├── Homestead.example.yaml          配置文件模板
├── Homestead.yaml                  实际配置文件
├── README.md                       说明文档
├── Vagrantfile                     vagrant配置文件
├── after.sh                        启动后执行脚本
├── aliases                         系统别名
├── composer.json
├── composer.lock
└── vendor
    ├── autoload.php
    ├── bin
    ├── composer
    ├── laravel                     Homestead源码
    └── symfony
```

## 其他

### 快捷命令

mac用户将如下函数放置到个人设置，windows可自行百度：

```bash
 # 文件位置： ~/.bash_profile,编辑后执行 source .bash_profile
# 使用方法为 <函数名>+命令，例如：homestead up == cd cd <homestead目录> && vagrant up
 #Homestead
function homestead() { # 函数名
    ( cd <homestead目录> && vagrant $* )
}
```

## 默认密码

### mysql

user:root<br/>
passwd:root