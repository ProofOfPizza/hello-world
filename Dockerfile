FROM maven:3.6-jdk-8-openj9
#ARG git-user
#ARG git-passV
RUN apt-get update && apt-get install -y \
git \
vim
RUN git clone git@github.com:ProofOfPizza/hello-world.git && git checkout hooks
