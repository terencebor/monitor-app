FROM alpine:latest

RUN echo "http://dl-8.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk --no-cache --update-cache add gcc gfortran python python-dev py-pip build-base wget freetype-dev libpng-dev openblas-dev && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install --no-cache-dir numpy &&\
    pip install --upgrade pip setuptools && \
    pip install web.py 


WORKDIR /tmp

EXPOSE 8080

COPY ./rotator /tmp

ENTRYPOINT ["/usr/bin/python"]

CMD ["/tmp/rotator.py"]
