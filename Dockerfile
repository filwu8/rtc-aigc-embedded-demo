# 使用官方Python 3.8 slim镜像
FROM python:3.8-slim

# 设置清华PyPI镜像
RUN echo '[global]' > /etc/pip.conf && \
    echo 'index-url = https://pypi.tuna.tsinghua.edu.cn/simple' >> /etc/pip.conf && \
    echo '[install]' >> /etc/pip.conf && \
    echo 'trusted-host = pypi.tuna.tsinghua.edu.cn' >> /etc/pip.conf

# 安装Python依赖（使用--no-cache-dir减少镜像体积）
RUN pip install --no-cache-dir requests

# 复制应用程序代码
COPY . /app

# 设置工作目录
WORKDIR /app/server/src

# 暴露端口 8080
EXPOSE 8080

# 启动服务
CMD ["python", "RtcAigcService.py"]    