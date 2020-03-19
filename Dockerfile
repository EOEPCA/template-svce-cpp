FROM centos/devtoolset-7-toolchain-centos7
LABEL Author="Roberto di Rienzo"
LABEL project="builder-svce-cpp"

USER root
ENV HOME /root

RUN yum update -y && \
    yum upgrade -y && \
    yum install -y sudo vim wget unzip openssh-clients openssh-server \
    make bzip2 kernel-devel pkgconfig openssl openssl-devel libxml2 libxml2-devel \
    libcurl-devel libcurl curl zlib-devel bison  libxslt libxslt-devel \
    python-devel   libuuid-devel     which  \
    && ln -s /opt/rh/devtoolset-7/enable /etc/profile.d/rhgccenable.sh && chmod +x /etc/profile.d/rhgccenable.sh


WORKDIR $HOME
RUN wget https://cmake.org/files/v3.12/cmake-3.12.2.tar.Z && \
    tar -zxvf cmake-3.12.2.tar.Z && \
    cd cmake-3.12.2 && \
    ./bootstrap && \
    make && \
    make install && \
    cd && rm -fvR cmake*

RUN yum install -y epel-release && yum install -y fcgi-devel  proj-devel

RUN cd && \wget http://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz && \
	tar -zxvf libtool-2.4.6.tar.gz && \
	cd libtool-2.4.6 && ./configure && make && make install && \
	cd && rm -fvR libtool*

RUN yum install -y automake && \
	cd && \
	wget http://ftp.gnu.org/gnu/cgicc/cgicc-3.2.19.tar.gz && \
	tar -zxvf cgicc-3.2.19.tar.gz && \
	cd cgicc-3.2.19 && ./autogen && ./configure && make && make install && \
	cd && rm -fvR cgicc*

ENV PATH "$PATH:/usr/local/bin"

RUN yum install -y openssl openssl-devel

RUN yum install -y nginx  log4cplus  log4cplus-devel



