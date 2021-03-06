FROM openshift/base-centos7

MAINTAINER Alex Filipovici <alex.filipovici@dhl.com>

LABEL io.k8s.description="An NGINX builder image" \
	io.k8s.display-name="NGINX Builder Image" \
	io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

RUN yum install -y epel-release && \
	yum makecache fast

RUN INSTALL_PKGS="tar unzip nginx" && \
	yum install -y $INSTALL_PKGS && \
	yum clean all && \
	rm -rf /var/cache/yum

COPY s2i /usr/libexec/s2i

EXPOSE 8080

USER 1001

CMD ["/usr/libexec/s2i/usage"] 

