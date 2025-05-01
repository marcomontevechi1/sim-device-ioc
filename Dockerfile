FROM mambaorg/micromamba:debian12-slim

COPY ./* /ioc/

RUN micromamba create -y -n ioc -f /ioc/environment.yml
