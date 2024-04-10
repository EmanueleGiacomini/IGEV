FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel

RUN pip install opencv-python scikit-image tensorboard matplotlib tqdm timm==0.5.4 opt-einsum

# OpenCV dependencies
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

