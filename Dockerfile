FROM mgibio/vep:v90
MAINTAINER John Garza <johnegarza@wustl.edu>

LABEL \
    description="VEP image with the locale bugfix applied"

#fix ubuntu locale bug- other suggestions at
#https://stackoverflow.com/questions/8671308/non-interactive-method-for-dpkg-reconfigure-tzdata

USER root

RUN apt-get update -y && apt-get install -y libnss-sss tzdata
RUN ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

RUN echo "America/Chicago" > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

USER vep
