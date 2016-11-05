FROM java:8-jre

MAINTAINER delivery-engineering@netflix.com

COPY ./orca-web/build/distributions/*.deb workdir/packages/

WORKDIR workdir

RUN dpkg -i ./packages/*.deb

EXPOSE 8083

CMD ["/opt/orca/bin/orca"]
