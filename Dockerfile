FROM registry.access.redhat.com/rhel7/rhel
MAINTAINER Patrick Schlaepfer <patrick.schlaepfer>

# Add Web server, subversion, update image, and clear cache
RUN yum -y install mod_dav_svn subversion && yum -y update; yum clean all &&\
  mkdir /var/www/svn &&\
  cd /var/www/svn; svnadmin create testrepo  &&\
  chown -R apache.apache /var/www/svn 

EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
