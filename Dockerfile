ARG ATHENS_VERSION=v0.11.0
FROM docker.io/gomods/athens:${ATHENS_VERSION}
COPY git-credentials-fromenv /bin
ARG CRED_VER=1.1.1
RUN wget https://github.com/mackee/git-credential-github-apps/releases/download/v${CRED_VER}/git-credential-github-apps_${CRED_VER}_Linux_x86_64.tar.gz
RUN tar -xf git-credential-github-apps_${CRED_VER}_Linux_x86_64.tar.gz
RUN mv git-credential-github-apps /bin
RUN rm git-credential-github-apps_${CRED_VER}_Linux_x86_64.tar.gz
RUN git config --global credential.helper 'fromenv'
