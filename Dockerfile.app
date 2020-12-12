FROM maven:3.6-jdk-8-openj9 as build
#ARG git-user
#ARG git-passV
#RUN apt-get update && apt-get install -y \
#vim
#RUN adduser -D appuser
WORKDIR /src
COPY . .
RUN mvn clean install -Dmaven.test.skip=true
RUN ls

FROM tomcat:8-jre8 as release
WORKDIR /src
COPY --from=build /src/webapp/target/webapp.war /usr/local/tomcat/webapps

