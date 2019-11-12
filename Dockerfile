FROM python:3.6

# --------------------------------------------------------------------------------------------
# Install Cytomine python client
RUN git clone https://github.com/cytomine-uliege/Cytomine-python-client.git && \
    cd /Cytomine-python-client && git checkout tags/v2.2.0 && pip install . && \
    rm -r /Cytomine-python-client

# --------------------------------------------------------------------------------------------
# Instal Pyxit
RUN pip install pyxit==1.1.3

# --------------------------------------------------------------------------------------------
# Instal Pyxit
ADD descriptor.json /app/descriptor.json
ADD run.py /app/run.py

ENTRYPOINT ["python", "/app/run.py"]
