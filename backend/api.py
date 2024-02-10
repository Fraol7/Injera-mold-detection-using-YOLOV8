import io
from ultralytics import YOLO
from ultralytics.utils.plotting import Annotator
from fastapi import FastAPI, File, UploadFile
from PIL import Image 
import numpy as np
import matplotlib.pyplot as plt
import cv2
from fastapi.responses import FileResponse
import base64       
import uvicorn

app = FastAPI()
model = YOLO('best.pt')
def patch_image(img, results):
    boxes = results[0].boxes.xyxy
    for box in boxes:
        x1, y1, x2, y2 = box[0], box[1], box[2], box[3] 
        pt1 = (int(x1), int(y1))
        pt2 = (int(x2), int(y2))
        cv2.rectangle(img, pt1, pt2, (200, 0, 0), 1) 

    return img        
@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.post("/predict")
async def predict_mold(image: UploadFile = File(...)):
    contents = await image.read()
    pil_image = Image.open(io.BytesIO(contents))
    img = np.asarray(pil_image)
    results = model.predict(img)
    patched_img = patch_image(img, results)
    print('server is running') 
    
    # converting the image to bytes using PNG format
    is_success, im_buf_arr = cv2.imencode(".png", patched_img)
    byte_im = im_buf_arr.tobytes()
    
    # encode to base64
    modified_image_base64 = base64.b64encode(byte_im).decode('utf-8')
    


    # modified_image_bytes = patched_img.tobytes()
    # modified_image_base64 = base64.b64encode(modified_image_bytes).decode('utf-8')
    # print(modified_image_base64)

    return {"modified_image": modified_image_base64}

  

    

if __name__ == "__main__":
    
    uvicorn.run(app, host="0.0.0.0", port=8000)
   

 
  