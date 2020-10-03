FROM gitpod/workspace-postgres

# default user is gitpod
# Cannot use entrypoint as gitpod already using that
# Run this url https://gitpod.io/#<https://github.url/to-the-repo> for main branch
# Run this url https://gitpod.io/#<https://github.url/to-the-repo/tree/branch-name> for specific branch

# apt update
RUN sudo apt-get update

# Install other software needed
# RUN sudo apt-get install -y <software>

# Install software while using noninteractive debian frontend to avoid setting keyboard config
# RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y <software>

# remove lists and tmp
RUN sudo rm -rf /var/lib/apt/lists/* /tmp/*

# apt clean
RUN sudo apt-get clean

# ENTRYPOINT doesn't work in gitpod dockerfiles
# ENV DATABASE_URL="postgresql://gitpod@localhost/postgres" is the most impt
# but we load this via init in the .gitpod.yml Python task

# Switch to root user in case need to use curl to install software via bash
USER root

# curl install software via bash
# RUN curl <some-url!> | bash

# Switch back to gitpod
USER gitpod


