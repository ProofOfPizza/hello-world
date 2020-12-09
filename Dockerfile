FROM maven:3.6-jdk-8-openj9 as build
#ARG git-user
#ARG git-passV
#RUN apt-get update && apt-get install -y \
#vim
#RUN adduser -D appuser
COPY . /src/
WORKDIR /src
RUN ["mvn", "clean","install"]
RUN ls

FROM tomcat:8-jre8 as release
COPY --from=build ./webapp/target/webapp.war /usr/local/tomcat/webapps


