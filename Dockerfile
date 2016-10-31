FROM java:8

MAINTAINER delivery-engineering@netflix.com

ENV FRONT50_HOST front50
ENV IGOR_HOST igor
ENV REDIS_URL redis://redis:6379

COPY . workdir/

WORKDIR workdir

RUN GRADLE_USER_HOME=cache ./gradlew buildDeb -x test

RUN dpkg -i ./orca-web/build/distributions/*.deb

CMD ["/opt/orca/bin/orca"]
