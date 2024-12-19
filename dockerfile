# Use an official Python image
FROM python:3.11-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC

# Install necessary packages for LaTeX and Jupyter
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-xetex \
    texlive-science \
    texlive-lang-all \
    dvipng \
    ghostscript \
    build-essential \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Jupyter and common Python libraries
RUN pip install --no-cache-dir \
    notebook \
    jupyter \
    matplotlib \
    pandas \
    numpy \
    scipy

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && curl -L https://github.com/jgm/pandoc/releases/download/3.1.2/pandoc-3.1.2-1-amd64.deb -o pandoc.deb \
    && dpkg -i pandoc.deb \
    && rm pandoc.deb \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
# Expose the default Jupyter port
EXPOSE 8888

# Set the working directory
WORKDIR /home/jupyter

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
