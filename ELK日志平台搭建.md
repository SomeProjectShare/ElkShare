# Elk7.0.1部署

	ELK即Elasticsearch、Logstash、Kibana,组合起来可以搭建线上日志系统，本文主要讲解使用ELK来收集SpringBoot应用产生的日志。

### 参照文章

[使用Docker Compose部署SpringBoot应用](https://mp.weixin.qq.com/s/iMl9bJ4SxUsNHBbiS5VUcw "使用Docker Compose部署SpringBoot应用")<br/>
[SpringBoot应用整合ELK实现日志收集](https://juejin.im/post/5d2738a2f265da1bac404299 "SpringBoot应用整合ELK实现日志收集")

### ELK中各个服务的作用
- Elasticsearch:用于存储收集到的日志信息；
- Logstash:用于收集日志，SpringBoot应用整合了Logstash以后会把日志发送给Logstash,Logstash再把日志转发给Elasticsearch；
- Kibana:通过Web端的可视化界面来查看日志。

### 使用Docker Compose 搭建ELK环境

#### 需要下载的Docker镜像
<pre>docker pull elasticsearch:6.4.0
docker pull logstash:6.4.0
docker pull kibana:6.4.0 </pre>



