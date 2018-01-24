galaxy-web 后台开发框架脚手架
**平台简介**
galaxy-web是高效率,易读性，可维护性，可扩展性，面向微服的开源Java EE开发框架。

**技术选型**
1、后端
核心框架：Spring Boot
安全框架：Apache Shiro
模板引擎：Thymeleaf
持久层框架：MyBatis
数据库连接池：Alibaba Druid
缓存框架：Ehcache 、Redis
日志管理：SLF4J
工具类：Apache Commons、Jackson，Maven 

2、前端
JS框架：jQuery
客户端验证：JQuery Validation
富文本在线编辑：summernote
数据表格：bootstrapTable
弹出层：layer
树结构控件：jsTree
UI:layui ,ElementUI,vue 

3、平台
服务器中间件：SpringBoot内置
数据库支持：MySql
开发环境：Java、Eclipse Java EE 、Maven 、Git


Oracle 创建序列号
create sequence seq_SYS_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;