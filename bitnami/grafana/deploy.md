
# 概览

## 自定义配置

- 版本:8.3.3,切换国内docker register.
- 增加节点容忍(devops=true),保证能够部署到devops主机.
- 资源限制cpu:0.5c,mem:4G , 部署资源需求cpu:0.25c,mem:2G
- 使用mysql实现数据持久化


# 部署

## 部署前初始化内容

```bash
kubectl_prod1 create namespace grafana
```

## 需要先部署bitnami-common

```bash
helm_prod1 dependency update
```

## 数据持久化

> 使用mysql实现grafana数据持久化,mysql中需要创建grafana database

## 修改配置文件

> 需要配置mysql权限,将下方配置添加到配合文件84行.

```text

# #################################### Database ####################################
# [database]
# # You can configure the database connection by specifying type, host, name, user and password
# # as separate properties or as on string using the url properties.

# # Either "mysql", "postgres" or "sqlite3", it's your choice
# type = mysql
# host = mysql:3306
# name = grafana
# user = admin
# # If the password contains # or ; you have to wrap it with triple quotes. Ex """#password;"""
# password = 

```

## 应用配置文件

```bash
kubectl_prod1 apply -f grafana-configmap.yaml
```

## 部署grafana

```bash
helm_prod1 upgrade --install grafana -f eks.yaml ./  -n grafana
```