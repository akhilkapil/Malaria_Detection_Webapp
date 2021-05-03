# Malaria Detection Webapp

Save humans by detecting and deploying Image Cells that contain Malaria or not!, jk this is just to make a front-end for a classification model.

# Project Overview

- The aim of this project is to focus on the first fundamental features of the decision making ability of an malaria detection web app, i.e., to develop a
deep learning model that reads infected and uninfected cells and classifies them correctly using Convolutional Neural Networks(CNNs).

- The images used in this work were whole slide images provided in the PEIR-VM repository built by the University of Alabama in Birmingham. The original whole slide image data contain significant amount of redundant information. In order to achieve good classification accuracy, image segmentation and de-noising are needed to extract only blood cells and remove those redundant image pixels simultaneously.
Several effective image processing techniques were used to accurately segment tiles into individual cells.

- I have developed the model using the custom CNN layers and hosted the app on Streamlit by deploying it on both Docker and Heroku.
- You can visit the app by clicking on this ![Link](https://malariadetectionapp.herokuapp.com/)

# Webapp Result

![Malaria Detection Webapp](https://github.com/akhilkapil/Malaria_Detection_Webapp/blob/main/Images%20and%20Gifs/demo_gif.gif)

# Files Description

IQGateway_malaria_detection_app.ipynb
- Contains the whole notebook along with model building and data transformations process.
- Evaluation and model explanaibility is also given at the end of the notebook.

app.py
- predict(): Takes an image as input from the function parameter, preprocesses it and feeds it to the model for results.

Procfile
- A Procfile is a file which describes how to run your application.

requirements.txt
- This has all the dependencies required for deployment.


# Observations/Findings 
![Misclassified Images](https://github.com/akhilkapil/Malaria_Detection_Webapp/blob/main/Images%20and%20Gifs/misclassification%20image.png)

- The dataset was quite balanced as both the classes were equally disributed.
- The accuracy obtained on test dataset was close to __96%__ which is quite good as the model was not overfitting.
- We can observe from the above subplots, how well our model is able to perform.

# Model Interpretation using LIME
- As for model explanaibility for an image, I was not able to link the functionality with Streamlit. therfore I couldn't host it on the app. 
- But I was able to use LIME(model interpratiablity explorer) to explain the model predictablitiy. The image below shows the explanation of why and how our model was able to predict the class for a random image. 

![Explian Prediction](https://github.com/akhilkapil/Malaria_Detection_Webapp/blob/main/Images%20and%20Gifs/LIME_image.PNG)
__Observations for a random image:__
- Now we know that our model classify our image as a Uninfected image
. __On the left image__ we can see that only super pixels where the real cell surface is visible are shown. 
- The white area is the cell composition are where most of the cell image is present.

- This means that our model is able to identify the area which belong to the cell and the one covered in black is mostly the background


- __On the right image__, the area of super-pixels colored in green are the ones that increases the probability of our image belong to infeced class while the super pixel colored in red are the ones that decrease that probability. 
- The yellow masked in the center of the image represent the presence of malaria cell, that's why even we can see the prediction for this image as __'Malaria Parasitized'__ as our model is paying attention to that area more specifically.

## Run the app with Docker 

Launch the streamlit app with docker:<br/>
         
          docker build -t myapp:latest .
          docker run -p 8501:8501 myapp
          streamlit run app.py
          
          The network will automatically after this. If not then visit http://localhost:8501/ 


