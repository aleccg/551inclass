FROM andrewosh/binder-base

MAINTAINER Jonas Kersulis <kersulis@umich.edu>

USER root

# Add Julia dependencies
RUN apt-get update
RUN apt-get install -y julia libnettle4 && apt-get clean

USER main

# Install Julia kernel
RUN julia -e 'Pkg.add("IJulia")'
RUN julia -e 'Pkg.add("Gadfly")'
RUN julia -e 'Pkg.update()'

# add Julia nightly build
USER root

RUN mkdir -p /home/main/julia_0.4 && \
    curl -kL https://julialang.s3.amazonaws.com/bin/linux/x64/0.4/julia-0.4.0-rc4-linux-x86_64.tar.gz | tar -C /home/main/julia_0.4 -xz --strip-components=1 -f -
#RUN ln -fs /home/main/julia_0.4/bin/julia j4

USER main

RUN /home/main/julia_0.4/bin/julia -e 'Pkg.add("IJulia")'
