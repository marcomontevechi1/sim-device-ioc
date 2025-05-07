FROM mambaorg/micromamba:debian12-slim

COPY ./* /opt/ioc/
WORKDIR /opt/ioc

RUN micromamba create -y -n ioc -f ./environment.yml

ENTRYPOINT micromamba run -n ioc iocsh st.cmd
