FROM dayreiner/splunk-universalforwarder:6.5.1

ENV SPLUNK_BACKUP_APP ${SPLUNK_BACKUP_DEFAULT_ETC}/etc/apps

# Enable File Input Monitor for docker host
COPY ta-dockerlogs_fileinput ${SPLUNK_BACKUP_APP}/ta-dockerlogs_fileinput
# remove savedsearches.conf as it is not needed on the forwarder
RUN rm -rf ${SPLUNK_BACKUP_APP}/ta-dockerlogs_fileinput/default/savedsearches.conf

# Enable Docker Stats Collection
ENV DOCKER_VERSION 1.13.0
COPY ta-dockerstats ${SPLUNK_BACKUP_APP}/ta-dockerstats
RUN chmod +x ${SPLUNK_BACKUP_APP}/ta-dockerstats/bin/*.sh
RUN apt-get update \
    && apt-get install -y curl jq \
    && curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
    && tar --strip-components=1 -xvzf docker-${DOCKER_VERSION}.tgz -C ${SPLUNK_BACKUP_APP}/ta-dockerstats/bin \
    && chmod +x ${SPLUNK_BACKUP_APP}/ta-dockerstats/bin/docker \
    && apt-get purge -y --auto-remove curl \
    && rm -rf /var/lib/apt/lists/*
