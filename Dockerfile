FROM python:3.7-slim
WORKDIR /MalariaDetectionWebapp
COPY ./requirements.txt /MalariaDetectionWebapp
RUN pip3 install -r requirements.txt
EXPOSE 8501
COPY ./app.py /MalariaDetectionWebapp
COPY ./malaria_calssifier_model.h5 /MalariaDetectionWebapp
CMD ["python","app.py"]