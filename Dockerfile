# Base image with JupyterHub and JupyterLab
FROM jupyter/pyspark-notebook:latest

# Switch to root to perform administrative tasks
USER root

# Copy data and notebook files into the container
COPY data /home/jovyan/data/
COPY Spark-EDA.ipynb /home/jovyan/Spark-EDA.ipynb

# Ensure data directory permissions
RUN chown -R jovyan:users /home/jovyan/data && chmod -R 777 /home/jovyan/data

# Create tmp directory and set permissions
RUN mkdir -p /home/jovyan/tmp && chown -R jovyan:users /home/jovyan/tmp && chmod -R 777 /home/jovyan/tmp

# Switch back to the non-root 'jovyan' user
USER jovyan

# Install any additional Python packages
RUN pip install pandas

# Set the command to start Jupyter Notebook with no token or password
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]
