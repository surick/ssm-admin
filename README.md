# ssm-admin
[![Build Status](https://travis-ci.org/surick/ssm-admin.svg?branch=master)](https://travis-ci.org/surick/ssm-admin)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/surick/ssm-admin/pulls)
[![GitHub stars](https://img.shields.io/github/stars/surick/ssm-admin.svg?style=social&label=Stars)](https://github.com/surick/ssm-admin)
[![GitHub forks](https://img.shields.io/github/forks/surick/ssm-admin.svg?style=social&label=Fork)](https://github.com/surick/ssm-admin)

## 前言


## 项目介绍

　　Privilege Management System Based on SSM + Redis + Freemarker + Shiro

### 组织结构

### 技术选型

#### 后端技术:
技术 | 名称 | 官网
----|------|----
Spring Framework | 容器  | [http://projects.spring.io/spring-framework/](http://projects.spring.io/spring-framework/)
SpringMVC | MVC框架  | [http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc)
Apache Shiro | 安全框架  | [http://shiro.apache.org/](http://shiro.apache.org/)
Spring session | 分布式Session管理  | [http://projects.spring.io/spring-session/](http://projects.spring.io/spring-session/)
MyBatis | ORM框架  | [http://www.mybatis.org/mybatis-3/zh/index.html](http://www.mybatis.org/mybatis-3/zh/index.html)
MyBatis Generator | 代码生成  | [http://www.mybatis.org/generator/index.html](http://www.mybatis.org/generator/index.html)
PageHelper | MyBatis物理分页插件  | [http://git.oschina.net/free/Mybatis_PageHelper](http://git.oschina.net/free/Mybatis_PageHelper)
Druid | 数据库连接池  | [https://github.com/alibaba/druid](https://github.com/alibaba/druid)
FluentValidator | 校验框架  | [https://github.com/neoremind/fluent-validator](https://github.com/neoremind/fluent-validator)
Thymeleaf | 模板引擎  | [http://www.thymeleaf.org/](http://www.thymeleaf.org/)
Velocity | 模板引擎  | [http://velocity.apache.org/](http://velocity.apache.org/)
FreeMark | 模板引擎  | [https://freemarker.apache.org/](https://freemarker.apache.org/)
ZooKeeper | 分布式协调服务  | [http://zookeeper.apache.org/](http://zookeeper.apache.org/)
Dubbo | 分布式服务框架  | [http://dubbo.io/](http://dubbo.io/)
TBSchedule & elastic-job | 分布式调度框架  | [https://github.com/dangdangdotcom/elastic-job](https://github.com/dangdangdotcom/elastic-job)
Redis | 分布式缓存数据库  | [https://redis.io/](https://redis.io/)
Solr & Elasticsearch | 分布式全文搜索引擎  | [http://lucene.apache.org/solr/](http://lucene.apache.org/solr/) [https://www.elastic.co/](https://www.elastic.co/)
Quartz | 作业调度框架  | [http://www.quartz-scheduler.org/](http://www.quartz-scheduler.org/)
Ehcache | 进程内缓存框架  | [http://www.ehcache.org/](http://www.ehcache.org/)
ActiveMQ | 消息队列  | [http://activemq.apache.org/](http://activemq.apache.org/)
JStorm | 实时流式计算框架  | [http://jstorm.io/](http://jstorm.io/)
FastDFS | 分布式文件系统  | [https://github.com/happyfish100/fastdfs](https://github.com/happyfish100/fastdfs)
Log4J | 日志组件  | [http://logging.apache.org/log4j/1.2/](http://logging.apache.org/log4j/1.2/)
Swagger2 | 接口测试框架  | [http://swagger.io/](http://swagger.io/)
sequence | 分布式高效ID生产  | [http://git.oschina.net/yu120/sequence](http://git.oschina.net/yu120/sequence)
AliOSS & Qiniu & QcloudCOS | 云存储  | [https://www.aliyun.com/product/oss/](https://www.aliyun.com/product/oss/) [http://www.qiniu.com/](http://www.qiniu.com/) [https://www.qcloud.com/product/cos](https://www.qcloud.com/product/cos)
Protobuf & json | 数据序列化  | [https://github.com/google/protobuf](https://github.com/google/protobuf)
Jenkins | 持续集成工具  | [https://jenkins.io/index.html](https://jenkins.io/index.html)
Maven | 项目构建管理  | [http://maven.apache.org/](http://maven.apache.org/)

#### 前端技术:
技术 | 名称 | 官网
----|------|----
jQuery | 函式库  | [http://jquery.com/](http://jquery.com/)
Bootstrap | 前端框架  | [http://getbootstrap.com/](http://getbootstrap.com/)
Bootstrap-table | Bootstrap数据表格  | [http://bootstrap-table.wenzhixin.net.cn/](http://bootstrap-table.wenzhixin.net.cn/)
Font-awesome | 字体图标  | [http://fontawesome.io/](http://fontawesome.io/)
material-design-iconic-font | 字体图标  | [https://github.com/zavoloklom/material-design-iconic-font](https://github.com/zavoloklom/material-design-iconic-font)
Waves | 点击效果插件  | [https://github.com/fians/Waves](https://github.com/fians/Waves)
zTree | 树插件  | [http://www.treejs.cn/v3/](http://www.treejs.cn/v3/)
Select2 | 选择框插件  | [https://github.com/select2/select2](https://github.com/select2/select2)
jquery-confirm | 弹出窗口插件  | [https://github.com/craftpip/jquery-confirm](https://github.com/craftpip/jquery-confirm)
jQuery EasyUI | 基于jQuery的UI插件集合体  | [http://www.jeasyui.com](http://www.jeasyui.com)
React | 界面构建框架  | [https://github.com/facebook/react](https://github.com/facebook/react)
Editor.md | Markdown编辑器  | [https://github.com/pandao/editor.md](https://github.com/pandao/editor.md)

#### 架构图


#### 模块依赖


#### 模块介绍


## 环境搭建

#### 开发工具:
- MySql: 数据库
- Tomcat: 应用服务器
- Git: 版本管理
- Nginx: 反向代理服务器
- Varnish: HTTP加速器
- IntelliJ IDEA: 开发IDE
- PowerDesigner: 建模工具
- Navicat for MySQL: 数据库客户端

#### 开发环境：
- Jdk7+
- Mysql5.5+
- Redis
- Zookeeper
- ActiveMQ
- Dubbo-admin
- Dubbo-monitor

### 工具安装

### 资源下载

- JDK7 [http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html](http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html "JDK7")
- Maven [http://maven.apache.org/download.cgi](http://maven.apache.org/download.cgi "Maven")
- Redis [https://redis.io/download](https://redis.io/download "Redis")
- ActiveMQ [http://activemq.apache.org/download-archives.html](http://activemq.apache.org/download-archives.html "ActiveMQ")
- ZooKeeper [http://www.apache.org/dyn/closer.cgi/zookeeper/](http://www.apache.org/dyn/closer.cgi/zookeeper/ "ZooKeeper")
- Dubbo [http://dubbo.io/Download-zh.htm](http://dubbo.io/Download-zh.htm "Dubbo")
- Elastic Stack [https://www.elastic.co/downloads](https://www.elastic.co/downloads "Elastic Stack")
- Nginx [http://nginx.org/en/download.html](http://nginx.org/en/download.html "Nginx")
- Jenkins [http://updates.jenkins-ci.org/download/war/](http://updates.jenkins-ci.org/download/war/ "Jenkins")
- dubbo-admin-2.5.3 [http://download.csdn.net/detail/shuzheng5201314/9733652](http://download.csdn.net/detail/shuzheng5201314/9733652 "dubbo-admin-2.5.3")
- dubbo-admin-2.5.4-SNAPSHOT-jdk8 [http://download.csdn.net/detail/shuzheng5201314/9733657](http://download.csdn.net/detail/shuzheng5201314/9733657 "dubbo-admin-2.5.4-SNAPSHOT-jdk8")

## 开发指南

### 编译流程

### 启动顺序（后台）

### 开发演示

### 部署方式

## 演示地址

### 预览图

### 数据模型

### 拓扑图

### 开发进度

### 常见问题

## 附件

## 许可证

