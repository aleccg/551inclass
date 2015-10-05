FROM andrewosh/binder-base

MAINTAINER Jonas Kersulis <kersulis@umich.edu>

USER root

# Add Julia dependencies
RUN apt-get update
RUN apt-get install -y julia libnettle4 && apt-get clean

#RUN echo "cacert=/etc/ssl/certs/ca-certificates.crt" >> /home/main/.curlrc

RUN mkdir -p /etc/pki/tls/certs

# symlink actual ca-certificates file to
# stupid redhat default
RUN ln -s /etc/ssl/certs/ca-certificates.crt  /etc/pki/tls/certs/ca-bundle.crt

# install Julia release candidate 4
RUN mkdir -p /home/main/julia_0.4 && \
    curl -kL https://julialang.s3.amazonaws.com/bin/linux/x64/0.4/julia-0.4.0-rc4-linux-x86_64.tar.gz | tar -C /home/main/julia_0.4 -xz --strip-components=1 -f -

# initialize Julia package dir
RUN /home/main/julia_0.4/bin/julia -e 'Pkg.update()'

# add necessary packages to REQUIRE
RUN echo 'IJulia\nPyPlot\nGadfly\nGraphs\nMAT\nJLD\nInteract\nReactive\nImages\nPyCall' > /home/main/.julia/v0.4/REQUIRE

# install packages & deps with Pkg.update()
RUN /home/main/julia_0.4/bin/julia -e 'Pkg.update()'

USER main
