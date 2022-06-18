# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.177.0/containers/alpine/.devcontainer/base.Dockerfile

ARG VARIANT="3"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-${VARIANT}

ARG NONROOT_USER=vscode

WORKDIR /home/${NONROOT_USER}

# Install tfenv
RUN git clone --depth 1 --branch v2.2.3 https://github.com/tfutils/tfenv.git /home/${NONROOT_USER}/.tfenv \
    && chown -R 1000:1000 /home/${NONROOT_USER}/.tfenv \
    && ln -s /home/${NONROOT_USER}/.tfenv/bin/* /usr/local/bin
