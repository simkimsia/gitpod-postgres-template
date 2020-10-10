FROM gitpod/workspace-postgres

# default user is gitpod
# Run this url https://gitpod.io/#https://github.com/<user>/<repo> OR
# https://gitpod.io/#https://github.com/<user>/<repo>/tree/<branch-name>

# need to run as root else curl and install and apt-get clean won't work
# so I skip all the sudo
USER root

RUN apt-get update

# Install your packages here

## <Some Package>

## Install Dropbear SSH server for chisel to work
#  Need the noninteractive to skip the keyboard config
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq dropbear

## Chisel
#  This runs thru the installer https://github.com/jpillora/installer
#  and caching may be an issue https://github.com/jpillora/installer/issues/9
RUN curl https://i.jpillora.com/chisel! | bash

# End of installing your packages

# remove lists and tmp
RUN rm -rf /var/lib/apt/lists/* /tmp/*

# apt clean
RUN apt-get clean

# ENTRYPOINT doesn't work in gitpod dockerfiles
# We load env variables in files inside .envs folder via .gitpod.yml

# Switch back to gitpod
USER gitpod


