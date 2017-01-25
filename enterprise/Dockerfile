#https://docs.docker.com/engine/reference/builder/
FROM dayreiner/splunk:6.5.1

ENV SPLUNK_BACKUP_APP ${SPLUNK_BACKUP_DEFAULT_ETC}/etc/apps

# Enable HEC with default token - 00000000-0000-0000-0000-000000000000
RUN rm -rf ${SPLUNK_BACKUP_APP}/splunk_httpinput
COPY /splunk_httpinput ${SPLUNK_BACKUP_APP}/splunk_httpinput

COPY /app-docker ${SPLUNK_BACKUP_APP}/app-docker
COPY /ta-dockerlogs_fileinput ${SPLUNK_BACKUP_APP}/ta-dockerlogs_fileinput

# Enable Docker Stats Collection
ENV DOCKER_VERSION 1.13.0
COPY /ta-dockerstats ${SPLUNK_BACKUP_APP}/ta-dockerstats
RUN chmod +x ${SPLUNK_BACKUP_APP}/ta-dockerstats/bin/*.sh \
    && apt-get update \
    && apt-get install -y jq curl \
    && curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
    && tar --strip-components=1 -xvzf docker-${DOCKER_VERSION}.tgz -C ${SPLUNK_BACKUP_APP}/ta-dockerstats/bin \
    && chmod +x ${SPLUNK_BACKUP_APP}/ta-dockerstats/bin/docker \
    && apt-get purge -y --auto-remove curl \
    && rm -rf /var/lib/apt/lists/*
    
# Enable UCP Monitoring 
COPY /ta-ucplogs-sysloginput ${SPLUNK_BACKUP_APP}/ta-ucplogs-sysloginput
