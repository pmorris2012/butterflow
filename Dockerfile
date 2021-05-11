FROM nvidia/opencl:devel-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common && apt-add-repository universe
RUN apt-get update && apt-get install -y git virtualenv python3-dev python3-pip ocl-icd-opencl-dev libopencv-dev python3-opencv ffmpeg python3-setuptools nvidia-opencl-dev nvidia-modprobe
RUN pip3 install tqdm

WORKDIR /
RUN git clone https://github.com/sandsmark/butterflow.git

#RUN virtualenv -p /usr/bin/python2 /buttervenv
#RUN . /buttervenv/bin/activate && echo "/usr/lib/python2.7/dist-packages" > /buttervenv/lib/python2.7/site-packages/butterflow.pth
#RUN /bin/bash deactivate

WORKDIR /butterflow
RUN python3 setup.py install

ENTRYPOINT ["butterflow"]
