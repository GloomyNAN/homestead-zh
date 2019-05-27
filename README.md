# Readme

## 首次安装

1. 克隆本项目，执行`composer install`;
2. 请将`Homestead.yaml.example`复制改名为`Homestead.yaml`并配置；
3. `vagrant up`;
   
## 目录结构

```
├── Homestead.example.yaml          配置文件例子
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