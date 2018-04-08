FROM arvindockerregistry.azurecr.io/jws31t8:latest

USER root

COPY deploy/ /opt/webserver/webapps


EXPOSE 8080 8443 8778 9300



LABEL io.k8s.description="Hello World Java app running on Centos 7 with JWS 3.1 Tomcat 8 and JRE 1.7" \
	com.redhat.deployments-dir="/opt/webserver/webapps" \
	com.redhat.dev-mode.port="JPDA_ADDRESS:8000" \
	org.jboss.product="webserver-tomcat8" \
	org.jboss.product.openjdk.version="1.8.0" \
	org.jboss.product.version="3.1.1" \
	org.jboss.product.webserver-tomcat8.version="3.1.1" \
	io.openshift.expose-services="8080:http" \
	version="0.5"

# TODO: Install required packages here:
# RUN yum install -y ... && yum clean all -y

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# This default user is created in the openshift/base-centos7 image
#USER 1000
USER 0
# TODO: Set the default CMD for the image
#CMD [ "/opt/webserver/bin/launch.sh"; /bin/bash -c "trap : TERM INT; sleep infinity & wait" ]
CMD [ "/opt/webserver/bin/launch.sh" ]
