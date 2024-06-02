# Van
> 项目介绍：随便写的个人项目，似乎也用不上swagger😄

# 目标
无

# 安装步骤
1. 创建一个数据库：van
2. 执行db文件夹内的sql脚本
3. 将application-local.yml.bak复制一份，重命名为：application-local.yml
4. VM Options添加 `--add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.lang.invoke=ALL-UNNAMED`
5. 启动VanApplication

# 数据库备份
```shell
mysqldump -uroot -p --databases van > van.sql
```

# Feature
1. 自动完成字段 增删(需要动态生成并执行SQL)



> 大家在使用本项目时，推荐结合贺波老师的书[《深入Activiti流程引擎：核心原理与高阶实战》](https://item.jd.com/13928958.html)，这本书对系统学习和深入掌握Activiti/Flowable的用法非常有帮助。

![book-thumb.jpg](docs%2Fimages%2Fbook-thumb.jpg)