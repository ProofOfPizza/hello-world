FROM maven:3.6-jdk-8-openj9
RUN apt-get update && apt-get install -y \
git\
vim\

