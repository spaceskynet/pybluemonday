FROM python:3.6-alpine as py36
RUN apk add --update --no-cache golang make build-essential libffi-dev git && \
        rm -rf /var/cache/apk/* && \
        rm -rf /root/.cache/
WORKDIR /root
COPY . /root
RUN python setup.py bdist_wheel

FROM python:3.7-alpine as py37
RUN apk add --update --no-cache golang make build-essential libffi-dev git && \
        rm -rf /var/cache/apk/* && \
        rm -rf /root/.cache/
        WORKDIR /root
COPY . /root
RUN python setup.py bdist_wheel

FROM python:3.8-alpine as py38
RUN apk add --update --no-cache golang make build-essential libffi-dev git && \
        rm -rf /var/cache/apk/* && \
        rm -rf /root/.cache/
WORKDIR /root
COPY . /root
RUN python setup.py bdist_wheel

FROM python:3.9-alpine as py39
RUN apk add --update --no-cache golang make build-essential libffi-dev git && \
        rm -rf /var/cache/apk/* && \
        rm -rf /root/.cache/
WORKDIR /root
COPY . /root
RUN python setup.py bdist_wheel

FROM python:3.10-alpine as py310
RUN apk add --update --no-cache golang make build-essential libffi-dev git && \
        rm -rf /var/cache/apk/* && \
        rm -rf /root/.cache/
WORKDIR /root
COPY . /root
RUN python setup.py bdist_wheel

FROM alpine
RUN mkdir -p dist
WORKDIR /root/dist
COPY --from=py36 /root/dist .
COPY --from=py37 /root/dist .
COPY --from=py38 /root/dist .
COPY --from=py39 /root/dist .
COPY --from=py310 /root/dist .