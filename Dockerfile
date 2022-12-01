FROM jupyter/minimal-notebook:latest

COPY ./requirements.txt ./
RUN pip install -r requirements.txt

RUN git clone https://github.com/jroakes/querycat.git && \
    pip install -r querycat/requirements_colab.txt