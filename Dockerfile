FROM andrewosh/binder-base

MAINTAINER Jonas Kersulis <kersulis@umich.edu>

USER root

# Add Julia dependencies
RUN apt-get update
RUN apt-get install -y julia libnettle4 && apt-get clean

# add Julia nightly build
USER root

RUN mkdir -p /home/main/julia_0.4 && \
    curl -kL https://julialang.s3.amazonaws.com/bin/linux/x64/0.4/julia-0.4.0-rc4-linux-x86_64.tar.gz | tar -C /home/main/julia_0.4 -xz --strip-components=1 -f -

RUN /home/main/julia_0.4/bin/julia -e 'Pkg.add("MAT")'

USER main

# fix ca-certs issue (to install Blosc)
RUN echo "cacert=/etc/ssl/certs/ca-certificates.crt" >> /home/main/.curlrc

RUN cat <<EOT >> /home/main/.julia/v0.4/REQUIRE
PyPlot
Gadfly
Graphs
MAT
JLD
Interact
Reactive
Images
EOT

RUN /home/main/julia_0.4/bin/julia -e 'Pkg.update()'
