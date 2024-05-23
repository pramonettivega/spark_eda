# Base image with JupyterHub and JupyterLab
FROM jupyter/pyspark-notebook:latest

USER root

COPY data /home/jovyan/data/
COPY Spark-EDA.ipynb /home/jovyan/Spark-EDA.ipynb

RUN chown -R jovyan:users /home/jovyan/data && chmod -R 777 /home/jovyan/data

RUN mkdir -p /home/jovyan/tmp && chown -R jovyan:users /home/jovyan/tmp && chmod -R 777 /home/jovyan/tmp

USER jovyan

RUN pip install pandas

CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]
