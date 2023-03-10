FROM openvino/ubuntu20_runtime:latest
USER jasmine
RUN apt-get update
RUN pip3 install --upgrade pip \
  && pip3 install paddlepaddle==2.4.2 -i https://pypi.tuna.tsinghua.edu.cn/simple \
  && pip3 install flask \
  && pip3 install opencv-python \
  && pip3 install numpy \
  && pip3 install openvino==2022.3.0 \
  && pip3 install onnxruntime-openvino
RUN mkdir /app
RUN mkdir /app/codes
WORKDIR /app
COPY ./codes /app/codes
COPY run.sh ./
RUN chmod +x run.sh
RUN chmod -R 777 /app
CMD ["./run.sh"]