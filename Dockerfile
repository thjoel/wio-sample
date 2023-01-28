# [START dockerfile]
FROM python:3.7-slim
RUN pip install flask && pip install google-cloud-compute
WORKDIR /app
COPY app.py /app/app.py
ENTRYPOINT ["python"]
CMD ["/app/app.py"]
# [END dockerfile]
