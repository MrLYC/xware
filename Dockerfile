FROM w1yd/kodexplorer
MAINTAINER lyc <imyikong@gmail.com>

RUN apt-get update && \
    apt-get install -y libc6-i386 lib32z1 && \
    ln -s /data/TDDOWNLOAD/ /app/data/User/admin/home/download/TDDOWNLOAD/

WORKDIR /xware
ADD Xware1.0.31_x86_32_glibc.tar.gz /xware
ADD monitor.sh /xware

VOLUME /data

CMD ["./monitor.sh"]
