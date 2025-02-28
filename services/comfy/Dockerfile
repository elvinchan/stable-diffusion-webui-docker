FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive PIP_PREFER_BINARY=1

RUN apt-get update && apt-get install -y --no-install-recommends \
  git g++ libgl1 libglib2.0-0 pigz \
  && rm -rf /var/lib/apt/lists/*

ENV ROOT=/stable-diffusion
RUN git clone --branch v0.3.7 --depth 1 https://github.com/comfyanonymous/ComfyUI.git ${ROOT}

WORKDIR ${ROOT}
COPY . /docker/
RUN chmod u+x /docker/entrypoint.sh && cp /docker/extra_model_paths.yaml ${ROOT}

RUN --mount=type=cache,target=/root/.cache/pip \
pip install \
  -r ${ROOT}/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/2.55.5/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/yolain/ComfyUI-Easy-Use/v1.2.7/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/Gourieff/ComfyUI-ReActor/refs/heads/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/Fannovel16/comfyui_controlnet_aux/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/city96/ComfyUI-GGUF/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/adieyal/comfyui-dynamicprompts/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/XLabs-AI/x-flux-comfyui/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/elvinchan/ComfyUI_CatVTON_Wrapper/refs/heads/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/chflame163/ComfyUI_LayerStyle/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/chflame163/ComfyUI_LayerStyle_Advance/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/ltdrdata/ComfyUI-Inspire-Pack/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/cubiq/ComfyUI_essentials/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/kijai/ComfyUI-KJNodes/main/requirements.txt \
  -r https://gh-proxy.com/raw.githubusercontent.com/kijai/ComfyUI-SUPIR/main/requirements.txt \
  onnxruntime-gpu

ENV NVIDIA_VISIBLE_DEVICES=all PYTHONPATH="${PYTHONPATH}:${PWD}" CLI_ARGS=""
EXPOSE 7861
ENTRYPOINT ["/docker/entrypoint.sh"]
CMD python -u main.py --listen --port 7861 ${CLI_ARGS}
