FROM centos:centos6

MAINTAINER robihidayat122@gmail.com

# Enable EPEL for Node.js
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node...
RUN yum install -y npm

#Copy Packages
COPY client client

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Install app and dependencies into /src
RUN cd /client; npm install


EXPOSE 8080

CMD cd /client && node start