FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN  apt-get update && \
     apt-get install -y acl attr autoconf bison build-essential \
     debhelper dnsutils docbook-xml docbook-xsl flex gdb krb5-user \
     libacl1-dev libaio-dev libattr1-dev libblkid-dev libbsd-dev \
     libcap-dev libcups2-dev libgnutls28-dev libjson-perl \
     libldap2-dev libncurses5-dev libpam0g-dev libparse-yapp-perl \
     libpopt-dev libreadline-dev perl perl-modules pkg-config \
     python-all-dev python-dev python-dnspython python-crypto \
     xsltproc zlib1g-dev \
     wget

WORKDIR /usr/src

RUN  wget http://www.samba.org/samba/ftp/stable/samba-4.3.2.tar.gz && \
     tar -zxf samba-4.3.2.tar.gz -C /usr/src && \
     rm samba-4.3.2.tar.gz


WORKDIR /usr/src/samba-4.3.2

RUN  ./configure && \
     make

#RUN  apt-get install -y checkinstall && \
#     checkinstall  --install=no --fstrans --pkgname="samba" --pkgversion="4,3,2" -y -D make install

# ln -s /usr/local/samba/lib/libnss_winbind.so.2 /lib/x86_64-linux-gnu/
# ln -s /lib/x86_64-linux-gnu/libnss_winbind.so.2 /lib/x86_64-linux-gnu/libnss_winbind.so
