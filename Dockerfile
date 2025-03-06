FROM timpietruskyblibla/runpod-worker-comfy:3.4.0-flux1-dev

RUN pip install accelerate opencv-python libglib2.0-0

RUN git clone https://huggingface.co/sayeed99/segformer_b3_clothes /comfyui/models/segformer_b3_clothes && \
  git clone https://huggingface.co/google/siglip-so400m-patch14-384 /comfyui/models/clip/siglip-so400m-patch14-384 && \
  git clone https://huggingface.co/hustvl/vitmatte-small-composition-1k /comfyui/models/vitmatte; 

RUN git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git /comfyui/custom_nodes/ComfyUI-Impact-Pack
WORKDIR /comfyui/custom_nodes/ComfyUI-Impact-Pack 
RUN pip install -r requirements.txt 
# ComfyUI_LayerStyle
RUN git clone https://github.com/chflame163/ComfyUI_LayerStyle.git /comfyui/custom_nodes/ComfyUI_LayerStyle
WORKDIR /comfyui/custom_nodes/ComfyUI_LayerStyle
RUN pip install -r requirements.txt
RUN pip uninstall -y opencv-python opencv-contrib-python opencv-python-headless opencv-contrib-python-headless
RUN pip install -r repair_dependency_txt
# rgthree-comfy 
RUN git clone https://github.com/rgthree/rgthree-comfy.git /comfyui/custom_nodes/rgthree-comfy 
WORKDIR /comfyui/custom_nodes/rgthree-comfy 
RUN pip install -r requirements.txt 
# ComfyUI-Easy-Use
RUN git clone https://github.com/yolain/ComfyUI-Easy-Use.git /comfyui/custom_nodes/ComfyUI-Easy-Use
WORKDIR /comfyui/custom_nodes/ComfyUI-Easy-Use 
RUN pip install -r requirements.txt 
# ComfyUI_essentials
RUN git clone https://github.com/cubiq/ComfyUI_essentials.git /comfyui/custom_nodes/ComfyUI_essentials 
WORKDIR /comfyui/custom_nodes/ComfyUI_essentials 
RUN pip install -r requirements.txt 
# ComfyUI_Comfyroll_CustomNodes
RUN git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git /comfyui/custom_nodes/ComfyUI_Comfyroll_CustomNodes
# ComfyLiterals
RUN git clone https://github.com/M1kep/ComfyLiterals.git /comfyui/custom_nodes/ComfyLiterals

CMD ["/start.sh"]