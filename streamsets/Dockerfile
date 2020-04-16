FROM streamsets/datacollector:3.14.0

LABEL MAINTAINER Angel Alvarado "angel@molanco.com"
USER root
RUN apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install pyyaml ua-parser user-agents && \
    rm -r /root/.cache
USER ${SDC_USER}
# Install any additional stage libraries if requested
ARG SDC_LIBS
RUN "${SDC_DIST}/bin/streamsets" stagelibs -install="${SDC_LIBS}"
EXPOSE 18630
COPY ./docker-entrypoint.sh /
RUN chmod +r /docker-entrypoint.sh 
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["dc", "-exec"]