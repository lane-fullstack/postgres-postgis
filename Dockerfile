# 使用官方 PostgreSQL 18 镜像作为基础（官方镜像原生支持 ARM64）
FROM postgres:18

# 设置环境变量，防止安装过程中的交互提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新并安装 PostGIS 及其依赖
# PostgreSQL 18 的官方仓库通常已经包含对应的 postgis 包
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       postgresql-18-postgis-3 \
       postgresql-18-postgis-3-scripts \
       postgis \
    && rm -rf /var/lib/apt/lists/*

# 复制初始化脚本（可选，见下方说明）
# COPY ./init-db.sh /docker-entrypoint-initdb.d/init-db.sh

# 暴露端口
EXPOSE 5432