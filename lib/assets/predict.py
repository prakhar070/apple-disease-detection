import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import cv2
from keras import backend as K
import efficientnet.tfkeras
from keras.models import load_model
# Input data files are available in the "../input/" directory.
# For example, running this (by clicking run or pressing Shift+Enter) will list the files in the input directory

import os
import sys

# Any results you write to the current directory are saved as output.
#MEDIA_ROOT = os.path.join(BASE_DIR,"media")
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

file_path = sys.argv[1]

image_path = BASE_DIR+ "/images/testimages/" + file_path
model_path = BASE_DIR+"/my_model.h5"
image = cv2.imread(image_path)
image = cv2.resize(image, (512,512)) 
image_arr = np.array(image)
image_arr = np.expand_dims(image_arr, axis=0)
model = load_model(model_path)
out = model.predict(image_arr)
K.clear_session()

arr = np.array(out[0])
result = np.where(arr == np.amax(arr))[0]

if result == 0:
    print("Healthy")
elif result == 1:
    print("Multiple Disease")
elif result == 2:
    print("Rust")
else:
    print("Scab")