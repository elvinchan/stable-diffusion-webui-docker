#!/bin/bash

# reactor
pip install numpy==1.24.4
pip install insightface==0.7.3
pip install onnx==1.14.0
pip install onnxruntime-gpu==1.17.1
# dynamic-prompts
pip install send2trash~=1.8
pip install "dynamicprompts[attentiongrabber,magicprompt]~=0.30.4"
# controlnet
pip install fvcore==0.1.5.post20221221
pip install mediapipe==0.10.10
pip install svglib==1.5.1
pip install -U https://github.com/huchenlei/HandRefinerPortable/releases/download/v1.0.1/handrefinerportable-2024.2.12.0-py2.py3-none-any.whl
pip install -U https://github.com/huchenlei/Depth-Anything/releases/download/v1.0.0/depth_anything-2024.1.22.0-py2.py3-none-any.whl
# adetailer
pip install ultralytics>=8.1.18
pip install rich>=13.0.0

