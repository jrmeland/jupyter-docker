FROM jupyter/minimal-notebook:latest
USER root
RUN apt-get update --yes
RUN type -p curl >/dev/null || apt-get install curl -y
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
# Switch back to jovyan to avoid accidental container runs as root
USER ${NB_UID}
COPY ./requirements.txt ./
RUN pip install -r requirements.txt



RUN git clone https://github.com/jroakes/querycat.git && \
    pip install -r querycat/requirements_colab.txt
