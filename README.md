# grafana服务

该服务需要在worker节点上运行，包含open-gauss和grafana两个容器

第一次使用，请运行`pip install -r requirements.txt`

启动指令

```bash
./start.sh
```

## 数据库细节

open-gauss数据库基于 https://github.com/xy3xy3/openeuler-openGauss-docker-forstudy 构建

获取数据库初始数据卷

```bash
sudo docker run -d --name temp-opengauss xy3666/opengauss:6.0.0-openEuler
sudo docker cp temp-opengauss:/opt/openGauss/data ./dbdata
sudo docker stop temp-opengauss
sudo docker rm temp-opengauss
sudo chmod -R 700 ./dbdata
sudo chown -R 1000:1000 ./dbdata
```

数据库初始化建表语句

```bash
CREATE Table gauge (
    t DATE,
    cpu float(30),
    mem float(30),
    gpu_load float(30),
    gpu_mem float(30)
);

CREATE TABLE memory (
    t DATE,
    total float(30),
    used float(30)
);

CREATE TABLE gpumem (
    t DATE,
    total float(30),
    used float(30)
);

CREATE TABLE diskio (
    t DATE,
    read_rate float(30),
    write_rate float(30)
);

CREATE TABLE netio (
    t DATE,
    send_rate float(30),
    recv_rate float(30)
);
```

打包保存数据卷配置

```bash
tar -zcvf dbdata.tar.gz ./dbdata
```