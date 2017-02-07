FROM mjmg/centos-supervisor-base:latest


# Update System Image and install EPEL
RUN \
  yum update -y && \
  yum upgrade -y && \
  yum install -y epel-release

# Get Microsoft R Open
RUN \
  cd /tmp/ && \
  wget https://mran.microsoft.com/install/mro/3.3.2/microsoft-r-open-3.3.2.tar.gz && \
  tar -xvzf microsoft-r-open-3.3.2.tar.gz
  
RUN \
  /tmp/microsoft-r-open/install.sh -a -u

RUN \
  yum install -y  java-1.8.0-openjdk-headless \
                  gcc \
                  gcc-c++  \
                  texlive-collection-latexrecommended \
                  zip


CMD "/bin/bash"
