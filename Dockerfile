FROM centos
MAINTAINER santhosh <santhosh@gmail.com>
RUN yum install -y curl uzip wget
RUN yum install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64 -y
WORKDIR /opt
RUN mkdir -p /opt/tomcat
WORKDIR /opt/tomcat
ADD http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.42/bin/apache-tomcat-8.5.42.tar.gz /opt/tomcat
RUN tar -xvzf /opt/tomcat/apache-tomcat-8.5.42.tar.gz --strip-components=1
EXPOSE 8080
EXPOSE 8009
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
ADD SampleTest.war /opt/tomcat/webapps/

