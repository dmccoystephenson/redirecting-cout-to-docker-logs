FROM ubuntu:18.04
USER root

WORKDIR /redirection

# update
RUN apt-get update

# install build tools
RUN apt-get install -y g++

# install cmake
RUN apt-get install -y libprotobuf-dev protobuf-compiler cmake

# add source code and build files
ADD src /redirection/src/
ADD Makefile /redirection/
ADD cr.sh /redirection/

# compile and run program
RUN chmod +x /redirection/cr.sh
CMD ["/redirection/cr.sh"]