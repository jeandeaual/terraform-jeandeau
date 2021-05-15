# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.177.0/containers/alpine/.devcontainer/base.Dockerfile

# [Choice] Alpine version: 3.13, 3.12, 3.11, 3.10
ARG VARIANT="3.13"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-${VARIANT}

ARG NONROOT_USER=vscode

WORKDIR /home/${NONROOT_USER}

# Install tfenv
RUN git clone --depth 1 --branch v2.2.2 https://github.com/tfutils/tfenv.git /home/${NONROOT_USER}/.tfenv \
    && chown -R 1000:1000 /home/${NONROOT_USER}/.tfenv \
    && ln -s /home/${NONROOT_USER}/.tfenv/bin/* /usr/local/bin
