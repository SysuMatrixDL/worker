# grafana 魔改版

grafana 的默认管理员账号 `admin`，密码 `admin`

利用 docker/dockerfile 构建魔改版的 grafana 镜像

- `docker/grafana.db` 会被复制到容器内 `/var/lib/grafana/grafana.db`

  其中配置了 open-gauss 数据库连接配置、dashboard 的默认配置，实现仪表盘的开箱即用

- `docker/defaults.ini` 会被复制到容器内 `/usr/share/grafana/conf/defaults.ini`

  这是 grafana 的配置文件，主要修改是允许 grafana 被 iframe 嵌入并且能够被匿名访问

  [参考文献](https://blog.csdn.net/qq_41538097/article/details/121272955)